import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plasma/user.dart';
import 'package:plasma/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCity = "";
  String _bloodType = "";
  bool free = true;
  bool avaiable = true;

  User user;
  bool loading = false;
  bool loadingCache = true;

  Widget space() => SizedBox(
    height: 10,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String values = prefs.getString("user");

    if (values != null && values.isNotEmpty) {
      user = User.fromJson(json.decode(values));
      print(user);
      _selectedCity = cities[user.city];
      _bloodType = bloodType[user.bloodType];
      free = user.free;
      avaiable = user.available;
    } else {
      user = User();
    }
    setState(() {

      loadingCache = false;
    });
  }

  save() async{
    setState(() {
      loading = true;
    });
    //
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(user.toJson()));
    Navigator.of(context).pop();
    toasty("تم الحفظ بنجاح", Colors.green);
  }

  toasty(String txt,Color color){
    Fluttertoast.showToast(
        msg: txt,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل نفسى كمتبرع"),
        backgroundColor: const Color(0xffC12020),
      ),
      body: loadingCache ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                new Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  initialValue: (user == null || user.name == null) ? "": user.name,
                  decoration: InputDecoration(
                    labelText: 'الاسم',
                    alignLabelWithHint: true,
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) => value.isEmpty ? 'الاسم مطلوب' : null,
                  onSaved: (value) => user.name = value,
                ),
                space(),
                TextFormField(
                  initialValue: (user == null || user.phone == null) ? "" : user.phone,
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    alignLabelWithHint: true,
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) =>
                  value.length != 11 ? 'رقم الهاتف مطلوب' : null,
                  onSaved: (value) => user.phone = value,
                ),
                space(),
                space(),
                new DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedCity.isEmpty ? null : _selectedCity,
                  hint: Text("المدينة"),
                  items: cities.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                ),
                space(),
                space(),
                new DropdownButton<String>(
                  isExpanded: true,
                  value: _bloodType.isEmpty ? null : _bloodType,
                  hint: Text("فصيلة الدم"),
                  items: bloodType.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _bloodType = value;
                    });
                  },
                ),
                space(),
                new SwitchListTile(
                  title: Text(free ? "مجانى":"مدفوع"),
                  onChanged: (value) {
                    setState(() {
                      free = value;
                    });
                  },
                  value: free,
                ),space(),
                new SwitchListTile(
                  title: Text(avaiable ? "متاح للتبرع":"غير متاح للتبرع"),
                  onChanged: (value) {
                    setState(() {
                      avaiable = value;
                    });
                  },
                  value: avaiable,
                ),
                space(),
                TextFormField(
                  minLines: 3,
                  maxLines: 8,
                  initialValue: (user == null || user.note == null) ? "" : user.note,
                  textInputAction: TextInputAction.done,
                  onSaved: (value) => user.note = value,
                  decoration: InputDecoration(
                    labelText: 'ملاحظات او امراض اخرى',
                    alignLabelWithHint: true,
                  ),
                  // The validator receives the text that the user has entered.
                ),
                space(),
                space(),
                loading ? Center(child: CircularProgressIndicator()) : FlatButton.icon(
                        icon: Icon(
                          Icons.check,
                          color: color,
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (_selectedCity == "") {
                              toasty("برجاء اختيار المدينة", Colors.red);
                              return;
                            }
                            if (_bloodType == "") {
                              toasty("برجاء اختيار فصيلة الدم", Colors.red);
                              return;
                            }
                            _formKey.currentState.save();
                            user.city = cities.indexOf(_selectedCity);
                            user.bloodType = bloodType.indexOf(_bloodType);
                            user.free = free;
                            user.available = avaiable;
                            save();
                          }
                        },
                        label: Text(
                          "حفظ",
                          style: TextStyle(color: color),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
