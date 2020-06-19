import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plasma/contactUs.dart';
import 'package:plasma/info.dart';
import 'package:plasma/people.dart';
import 'package:plasma/register.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AE"),
      ],
      locale: Locale("ar", "AE"),
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget space() => SizedBox(
        height: 0,
      );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xffC12020),
      body: SingleChildScrollView(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: new Center(
                  child: new Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                  ),
                ),
                color: Colors.white,
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                height: 350.0,
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PeopleScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      label: Text(
                        "البحث عن متبرع",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  space(),
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.check_box,
                        color: Colors.white,
                      ),
                      label: Text("تسجيل نفسى كمتبرع",
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                  space(),
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfoScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                      label: Text("كيفية التبرع بالبلازما بأمان",
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                  space(),
                  FlatButton.icon(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactUsScreen()),
                        );
                      },
                      icon: Icon(
                        Icons.contact_phone,
                        color: Colors.white,
                      ),
                      label: Text("التواصل معنا",
                          style: TextStyle(color: Colors.white, fontSize: 20))),
                ],
              ),
            ]),
      ),
    );
  }

  void iconButtonPressed() {}
}
