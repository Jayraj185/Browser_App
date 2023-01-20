import 'package:browser/Screens/AppsScreen/view/AppsPage.dart';
import 'package:browser/Screens/BottomScreen/model/BottomModel.dart';
import 'package:browser/Screens/SearchScreen/view/SearchPage.dart';
import 'package:browser/Utils/SharedPref.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BottomProvider extends ChangeNotifier
{
  //Only Variable's
  List Screens =
  [
    SearchPage(),
    AppsPage()
  ];
  int index=0;
  int index2=0;
  double progress=0.0;
  double progress2=0.0;
  String? folder="Mobile Bookmarks";
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;
  TextEditingController txtSearch = TextEditingController();
  TextEditingController txtBookmarkName = TextEditingController();
  List<BottomModel> videoApp = [
    BottomModel(name: "HotStar",image: "assets/image/hotstar.jpg",url: "https://www.hotstar.com/in"),
    BottomModel(name: "Netflix",image: "assets/image/netflix.jpg",url: "https://www.netflix.com/in/"),
    BottomModel(name: "Sony LIV",image: "assets/image/sony_liv.jpg",url: "https://www.sonyliv.com/"),
    BottomModel(name: "Amazon Prime",image: "assets/image/amazon_prime.jpg",url: "https://www.primevideo.com/"),
  ];
  List<BottomModel> socialApp = [
    BottomModel(name: "WhatsApp",image: "assets/image/whatsapp.jpg",url: "https://www.whatsapp.com/"),
    BottomModel(name: "Instagram",image: "assets/image/instagram.jpg",url: "https://www.instagram.com/?hl=en"),
    BottomModel(name: "Facebook",image: "assets/image/facebook.jpg",url: "https://www.facebook.com/"),
    BottomModel(name: "Twitter",image: "assets/image/twitter.jpg",url: "https://twitter.com/"),
  ];
  List<BottomModel> newsApp = [
    BottomModel(name: "Divya Bhaskar",image: "assets/image/divya_bhasakr.jpg",url: "https://www.divyabhaskar.co.in/"),
    BottomModel(name: "Aaj Tak",image: "assets/image/aaj_tak_.png",url: "https://www.aajtak.in/"),
    BottomModel(name: "Zee News",image: "assets/image/zee_news.png",url: "https://zeenews.india.com/"),
    BottomModel(name: "Google News",image: "assets/image/google_news.jpg",url: "https://news.google.com/"),
  ];
  List<BottomModel> shoppingApp = [
    BottomModel(name: "Amazon",image: "assets/image/amazon.jpg",url: "https://www.amazon.in/"),
    BottomModel(name: "FlipKart",image: "assets/image/flipcard.png",url: "https://www.flipkart.com/"),
    BottomModel(name: "Meesho",image: "assets/image/meesho.jpg",url: "https://www.meesho.com/"),
    BottomModel(name: "Shopsy",image: "assets/image/shopsy.jpg",url: "https://www.shopsy.in/"),
  ];
  List<BottomModel> educationApp = [
    BottomModel(name: "Programiz",image: "assets/image/programiz.png",url: "https://www.programiz.com/"),
    BottomModel(name: "W3Schools",image: "assets/image/w3schools.jpg",url: "https://www.w3schools.com/"),
    BottomModel(name: "JavatPoint",image: "assets/image/javatpoint.png",url: "https://www.javatpoint.com/"),
    BottomModel(name: "TutorialsPoint",image: "assets/image/tutorialspoint.png",url: "https://www.tutorialspoint.com/"),
  ];
  List<BottomModel> SelectApp = [];
  List<String> BookMarkList = [];
  bool star=false;
  bool searchbar = true;
  var key = GlobalKey<FormState>();





  //Only Function's
  void ChangeIndex(inde)
  {
    index = inde;
    notifyListeners();
  }
  void ChangeIndex2(inde,select)
  {
    index2 = inde;
    SelectApp = select;
    notifyListeners();
  }
  void ChnageController(controller)
  {
    inAppWebViewController = controller;
    notifyListeners();
  }
  void ChnageProgress(prg)
  {
    progress = prg;
    // print("================>>>>>>>>>> ======= $progress");
    notifyListeners();
  }
  void ChnageProgress2(prg)
  {
    progress2 = prg;
    // print("================ PROGESS2 CHANGE VALUE =========== >>>>> $progress2");
    notifyListeners();
  }
  void LoadUrl(value)
  {
    inAppWebViewController!.loadUrl(
        urlRequest: URLRequest(
            url: Uri.parse("https://www.google.com/search?q=$value")
        )
    );
  }
  void LoadUrl2(e)
  {
    inAppWebViewController!.loadUrl(
        urlRequest: URLRequest(
            url: Uri.parse(e)
          // url: Uri.parse("https://www.google.com/search?q=${txtSearch.text}")
        )
    );
    CheckList();
    notifyListeners();
  }
  void ChnageFolder(value)
  {
    folder = value;
    print(folder);
    notifyListeners();
  }
  void AddText(text) {
    // print("================================   >>>> $text");
    // print("================================   >>>>\n $BookMarkList");
    Uri? uri = text;
    txtBookmarkName = TextEditingController(text: "$uri");
    notifyListeners();
  }
  void AddText2(String text)
  {
    // String link = "https://www.google.com/search?q=";
    // String url = "";
    // print("============ >>>>>> ${text[0]}");
    // for(int j=link.length; j<text.length; j++)
    //   {
    //     link = link + "a";
    //   }
    // print("============ >>>>>> ${link.length} &&&&&&&&& ${text.length}\n============== >>>> ${link} ");
    // for(int i=0; i<text.length; i++)
    //   {
    //     if(text[i] != link[i])
    //       {
    //         url = url + text[i];
    //       }
    //   }
    // print("================================   >>>> $url");
    txtSearch = TextEditingController(text: "$text");
    notifyListeners();
  }
  void BookMark(data) async
  {
    Uri? uri = await data;
    BookMarkList.add("$uri");
    // print("================================== >>>>>>>>>>>>>>>>>>>>>>\n$BookMarkList");
    notifyListeners();
  }
  void addbookmark() async
  {
    BookMarkList = (await ReadBookMark())!;
    CheckList();
    // print("================================== >>>>>>>>>>>>>>>>>>>>>>\n$BookMarkList");
    notifyListeners();
  }
  void CheckList()
  async {
    // print("=====================   CHECKLIST   ======================");
    // print("====================== >>>>>>>>>>>>>>>>>>>  \n$BookMarkList\n${await inAppWebViewController!.getOriginalUrl()}");
    for(int i=0; i<BookMarkList.length; i++)
      {
        if(BookMarkList[i] == "${await inAppWebViewController!.getOriginalUrl()}")
        // if(BookMarkList[i] == "${txtSearch.text}")
          {
            star=true;
            break;
          }
        else
          {
            star=false;
          }
      }
    print("===================== >>>>>>>>>>>>  $star");
    notifyListeners();
  }
  // void AddText2(text)
  // {
  //   print("================================   >>>> $text");
  //   print("================================   >>>>\n $BookMarkList");
  //   txtSearch = TextEditingController(text: "$text");
  //   print("================================   >>>> ${txtSearch.text}");
  //   notifyListeners();
  // }
  void CheckList2()
  async {
    for(int i=0; i<BookMarkList.length; i++)
      {
        if(BookMarkList[i] == "${await inAppWebViewController!.getOriginalUrl()}")
          {
            star=false;
            BookMarkList.removeAt(i);
            break;
          }
      }
    notifyListeners();
  }
  void Value()
  {
    progress=1.0;
    notifyListeners();
  }
  void SearchBarCheck()
  {
    if(txtSearch.text.isNotEmpty)
      {
        searchbar=false;
      }
    else
      {
        searchbar=true;
      }
    notifyListeners();
  }
}