import 'package:flutter/material.dart';
import 'package:plasma/utils.dart';

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

  Widget space() => SizedBox(
        height: 10,
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل نفسى كمتبرع"),
        backgroundColor: const Color(0xffC12020),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.add,color: Colors.white,),
            onPressed: null,
            label: Text("حفظ",style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      body: SingleChildScrollView(
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
                  decoration: InputDecoration(
                    labelText: 'الاسم',
                    alignLabelWithHint: true,
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) => value.isEmpty ? 'الاسم مطلوب' : null,
                ),
                space(),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    alignLabelWithHint: true,
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) =>
                      value.isEmpty ? 'رقم الهاتف مطلوب' : null,
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
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: 'ملاحظات او امراض اخرى',
                    alignLabelWithHint: true,
                  ),
                  // The validator receives the text that the user has entered.
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
