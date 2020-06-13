import 'package:flutter/material.dart';
import 'package:plasma/utils.dart';

class ContactUsScreen extends StatelessWidget {

  Widget circle() => Container(
  width: 8,
  decoration: new BoxDecoration(
  shape: BoxShape.circle,
  // You can use like this way or like the below line
  //borderRadius: new BorderRadius.circular(30.0),
  color: color,
  ),

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("التواصل معنا"),
        backgroundColor: color,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),

            ListTile(
              leading: Icon(Icons.phone_iphone),
              title: Text("رقم الهاتف"),
              subtitle: Text("01273144337 \n 01033987202"),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("البريد الالكترونى"),
              subtitle: Text("ahmedbassiouny26@gmail.com \n mohamed.moussa.soli@gmail.com"),
            ),

          ],
        ),
      ),
    );
  }
}
