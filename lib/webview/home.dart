import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:aqua/login_register/login.dart';
import 'package:aqua/webview/allanime.dart';


class home extends StatelessWidget {
  home({super.key});
  // This widget is the root of your application.
  GlobalKey<ScaffoldState>_globaKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _globaKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _globaKey,
        drawer: Drawer(
          child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color:  Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/images/cover.jpg'),
                          fit: BoxFit.cover
                      )
                  ),
                  accountEmail: Text('@User'),
                  accountName: Text('user'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/jifuyu.jpg'),
                  ),
                ),
                ListTile(
                  title: Text('หน้าแรก'),
                  onTap: (){},
                ),
              ]
          ),
        ),
        appBar: AppBar(
          title: Text("Watarebun Toon"),
          backgroundColor: Color(0xff885566),
        ),
        body: Stack(
          children: [
            WebViewExample(),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => login(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}



class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  late WebViewController _webViewController;
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(await _webViewController.canGoBack()){
          _webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: WebView(
        initialUrl: 'http://171.7.30.231:10/anime-main/index.php',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController controller){
          _webViewController = controller ;
        },
      ),
    );
  }
}
