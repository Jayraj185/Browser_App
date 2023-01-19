import 'package:browser/Screens/BottomScreen/Provider/BottomProvider.dart';
import 'package:browser/Utils/SharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  BottomProvider? ProviderTrue;
  BottomProvider? ProviderFalse;
  @override
  void initState() {
    super.initState();
    print("================== INITSTATE =====================");
    Provider.of<BottomProvider>(context,listen: false).addbookmark();
    Provider.of<BottomProvider>(context,listen: false).CheckList();
    Provider.of<BottomProvider>(context,listen: false).pullToRefreshController =
        PullToRefreshController(
          onRefresh: () async {
            // Provider.of<BottomProvider>(context,listen: false).inAppWebViewController!.reload();
            Provider.of<BottomProvider>(context,listen: false).inAppWebViewController!.loadUrl(
                urlRequest: URLRequest(
                    url: await Provider.of<BottomProvider>(context,listen: false).inAppWebViewController!.getUrl(),
                )
            );
          },
        );
  }
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<BottomProvider>(context,listen: true);
    ProviderFalse = Provider.of<BottomProvider>(context,listen: false);
    return SafeArea(
      child: Form(
        key: ProviderTrue!.key,
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(1.h),
                child: Container(
                  height: 5.5.h,
                  decoration: BoxDecoration(
                      color: Color(0xFFCEE0AA),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color(0xFF85D200),width: 2.5)
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          ProviderFalse!.inAppWebViewController!.goBack();
                          ProviderFalse!.CheckList();
                        },
                        icon: Icon(Icons.arrow_back,color: Colors.white,),
                      ),
                      IconButton(
                        onPressed: (){
                          ProviderFalse!.inAppWebViewController!.goForward();
                          ProviderFalse!.CheckList();
                        },
                        icon: Icon(Icons.arrow_forward,color: Colors.white,),
                      ),
                      IconButton(
                        onPressed: (){
                          ProviderTrue!.progress==1.0?ProviderFalse!.inAppWebViewController!.reload():ProviderFalse!.Value();
                          ProviderFalse!.CheckList();
                        },
                        icon: Icon(ProviderTrue!.progress==1.0?Icons.refresh:Icons.close,color: Colors.white,),
                      ),
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.only(bottom: 0.2.h),
                          child: TextField(
                            controller: ProviderTrue!.txtSearch,
                            onSubmitted: (value) {
                              ProviderFalse!.LoadUrl(ProviderTrue!.txtSearch.text);
                              ProviderFalse!.CheckList();
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                              hintText: "Search...."
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          ProviderFalse!.LoadUrl(ProviderTrue!.txtSearch.text);
                          ProviderFalse!.CheckList();
                        },
                        icon: Icon(Icons.search,color: Colors.white,),
                      ),
                      IconButton(
                        onPressed: (){
                          ProviderFalse!.AddText(ProviderFalse!.txtSearch.text.isEmpty?"":ProviderFalse!.txtSearch.text);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Edit Bookmark"),
                                    InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.close))
                                  ],
                                ),
                                actions: [
                                  OutlinedButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text("More..",style: TextStyle(color: Color(0xFF85D200)),)),
                                  SizedBox(width: 8.w,),
                                  ElevatedButton(onPressed: (){
                                    if(ProviderTrue!.key.currentState!.validate())
                                      {
                                        ProviderFalse!.BookMark(ProviderTrue!.txtBookmarkName.text);
                                        AddBookMark(ProviderTrue!.BookMarkList);
                                        ProviderFalse!.addbookmark();
                                        ProviderFalse!.CheckList();
                                        Navigator.pop(context);
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Bookmarks Name")));
                                      }
                                  }, child: Text("Done"),style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF85D200)),),
                                  OutlinedButton(onPressed: (){
                                    ProviderFalse!.CheckList2();
                                    AddBookMark(ProviderTrue!.BookMarkList);
                                    Navigator.pop(context);
                                  }, child: Text("Remove",style: TextStyle(color: Color(0xFF85D200)))),
                                ],
                                content: Container(
                                  height:20.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Name",style: TextStyle(
                                            color: Color(0xFF85D200),
                                            fontSize: 15.sp
                                          ),),
                                          SizedBox(width: 3.w,),
                                          Container(
                                            height: 4.6.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(color: Colors.black12)
                                            ),
                                            child: TextFormField(
                                              controller: ProviderTrue!.txtBookmarkName,
                                              textInputAction: TextInputAction.next,
                                              cursorColor: Color(0xFF85D200),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(3),
                                                  borderSide: BorderSide(color: Color(0xFF85D200),width: 2)
                                                )
                                              ),
                                              validator: (value) {
                                                if(value!.isEmpty)
                                                  {
                                                    return "Please Enter Bookmarks Name";
                                                  }
                                                else
                                                  {
                                                    return null;
                                                  }
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Folder",style: TextStyle(
                                            color: Color(0xFF85D200),
                                            fontSize: 15.sp
                                          ),),
                                          SizedBox(width: 2.5.w,),
                                          Container(
                                            height: 4.6.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black12)
                                            ),
                                            child: Padding(
                                              padding:  EdgeInsets.only(left: 1.5.w),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    items: [
                                                      DropdownMenuItem(child: Text("Bookmarks bar"),value: "Bookmarks bar",),
                                                      DropdownMenuItem(child: Text("Other Bookmarks"),value: "Other Bookmarks",),
                                                      DropdownMenuItem(child: Text("Mobile Bookmarks"),value: "Mobile Bookmarks",),
                                                    ],
                                                    value: ProviderTrue!.folder,
                                                    onChanged: (value){
                                                      ProviderFalse!.ChnageFolder(value);
                                                    }
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );

                        },
                        icon: Icon(ProviderTrue!.star?Icons.star:Icons.star_border_outlined,color: ProviderTrue!.star?Color(0xFF85D200):Colors.white,),
                      ),
                    ],
                  ),
                ),
              ),
              ProviderTrue!.progress==1.0?Container():LinearProgressIndicator(
                value: ProviderTrue!.progress,
                color: Color(0xFF85D200),
                backgroundColor: Color(0xFFCEE0AA),
              ),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse("https://www.google.com/")),
                  onWebViewCreated: (controller) {
                    ProviderFalse!.ChnageController(controller);
                  },
                  onProgressChanged: (controller, progress) {
                    ProviderFalse!.ChnageProgress(progress/100);
                  },
                  pullToRefreshController: ProviderTrue!.pullToRefreshController!,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
