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
  BottomProvider? ProviderTrue;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<BottomProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "${ProviderTrue!.SelectApp[ProviderTrue!.index2].name}",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Color(0xFF2C2926),
          ),
          body: Column(
            children: [
              ProviderTrue!.progress2 ==
                      1.0
                  ? Container()
                  : LinearProgressIndicator(
                      value: ProviderTrue!.progress2,
                      color: Color(0xFF2C2926),
                      backgroundColor: Colors.grey,
                    ),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: Uri.parse(
                          "${ProviderTrue!.SelectApp[ProviderTrue!.index2].url}")),
                  onWebViewCreated: (controller) {
                    ProviderTrue!.ChnageController(controller);
                  },
                  onProgressChanged: (controller, progress) {
                    ProviderTrue!
                        .ChnageProgress2(progress/100);
                  },
                ),
              ),
            ],
          )),
    );
  }
}
