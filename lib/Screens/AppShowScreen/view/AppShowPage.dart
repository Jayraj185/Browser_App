import 'package:browser/Screens/BottomScreen/Provider/BottomProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class AppShowPage extends StatefulWidget {
  const AppShowPage({Key? key}) : super(key: key);

  @override
  State<AppShowPage> createState() => _AppShowPageState();
}

class _AppShowPageState extends State<AppShowPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${Provider.of<BottomProvider>(context,listen: true).SelectApp[Provider.of<BottomProvider>(context,listen: true).index2].name}",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Color(0xFF85D200),
        ),
        body: Column(
          children: [
            Provider.of<BottomProvider>(context,listen: true).progress2==1.0?Container():LinearProgressIndicator(
              value: Provider.of<BottomProvider>(context,listen: true).progress2,
              color: Color(0xFF85D200),
              backgroundColor: Color(0xFFCEE0AA),
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse("${Provider.of<BottomProvider>(context,listen: true).SelectApp[Provider.of<BottomProvider>(context,listen: true).index2].url}")),
                onProgressChanged: (controller, progress) {
                  Provider.of<BottomProvider>(context,listen: false).ChnageProgress2(progress);
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
