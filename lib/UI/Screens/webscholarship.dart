import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebScholarship extends StatefulWidget {


final String link;


WebScholarship(this.link);

  @override
_WebScholarshipState createState() => _WebScholarshipState();
}

class _WebScholarshipState extends State<WebScholarship> {





  String url ="";


  /////////////////////////Web View/////////////////////////////

  InAppWebViewController webView;
  ContextMenu contextMenu;
  double progress = 0;
  Future<bool> _willPopCallback() async {
    if (webView != null) {
      if (await webView.canGoBack()) {
        // get the webview history
        WebHistory webHistory = await webView.getCopyBackForwardList();
        // if webHistory.currentIndex corresponds to 1 or 0
        if (webHistory.currentIndex < 1) {
          // then it means that we are on the first page
          // so we can exit
          return true;
        }
        webView.goBack();
        return false;
      }
    }
    return true;// return true if the route to be popped
  }

  @override
  void initState() {
     this.url =widget.link;


////////////webView///////////////////////
    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(androidId: 1, iosId: "1", title: "Special", action: () async {
            print("Menu item Special clicked!");
            print(await webView.getSelectedText());
            await webView.clearFocus();
          })
        ],
        options: ContextMenuOptions(
            hideDefaultSystemContextMenuItems: true
        ),
        onCreateContextMenu: (hitTestResult) async {
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await webView.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          var id = (Platform.isAndroid) ? contextMenuItemClicked.androidId : contextMenuItemClicked.iosId;
          print("onContextMenuActionItemClicked: " + id.toString() + " " + contextMenuItemClicked.title);
        }
    );


    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
print("url  $url");
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(

          body:  WillPopScope(
            onWillPop: _willPopCallback,
            child: Container(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).padding.top),

              child: InAppWebView(
                  contextMenu: contextMenu,
                  initialUrl: widget.link,
                  //initialFile: "assets/index.html",
                  initialHeaders: {},
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                        debuggingEnabled: true,
                        useShouldOverrideUrlLoading: true
                    ),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webView = controller;
                    print("onWebViewCreated");
                  },
                  onLoadStart: (InAppWebViewController controller, String url) {
                    print("onLoadStart $url");
                    setState(() {
                      this.url = url;
                    });
                  },
                  shouldOverrideUrlLoading: (controller, shouldOverrideUrlLoadingRequest) async {
                    print("shouldOverrideUrlLoading");
                    return ShouldOverrideUrlLoadingAction.ALLOW;
                  },
                  onCreateWindow: (controller, onCreateWindowRequest) {
                    print("onCreateWindow");
                  },
                  onLoadStop: (InAppWebViewController controller, String url) async {
                    print("onLoadStop $url");
                    setState(() {
                      this.url = url;
                    });
                  },
                  onProgressChanged: (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                  onUpdateVisitedHistory: (InAppWebViewController controller, String url, bool androidIsReload) {
                    print("onUpdateVisitedHistory $url");
                    setState(() {
                      this.url = url;
                    });
                  }
              ),
            ),
          ),

        )
    );


  }
}
