import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppBrowserPage extends StatefulWidget {
  static String routeName = '/app-browser-page';

  @override
  State<InAppBrowserPage> createState() => _InAppBrowserPageState();

}

class _InAppBrowserPageState extends State<InAppBrowserPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double _progress = 0; //how much page has loaded
  late InAppWebViewController webView; //late modifier, non nullable at run time
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Our Youtube Channel'),
      ),
      body: Stack(
        children:[
        InAppWebView(
          initialUrlRequest: URLRequest(
            url:Uri.parse('https://www.youtube.com/c/BBCGoodFood/videos')
          ),
          onWebViewCreated: (InAppWebViewController controller){
            webView = controller;
          },
          onProgressChanged:(InAppWebViewController controller, int progress){
            setState(() {
              _progress = progress/100;
            });
    }
        ),
          _progress<1? SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              value: _progress,
              backgroundColor: Theme.of(context).accentColor.withOpacity(0.2),

            ),
          ):SizedBox()
    ]
      ),
    );
  }
}
