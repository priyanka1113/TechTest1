import 'package:flutter/material.dart';
import 'package:myproj/screens/mywebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SalonWebView extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("saloneverywhere sample profile"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyWebView(
                  title: "saloneverywhere",
                  selectedUrl: "https://saloneverywhere.com/sample-profiles",
                )
            ));
          },
        ),
      ),
    );
  }
}