import 'package:flutter/material.dart';
import 'package:plasma/utils.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  var selectIndex = -1;
  String _selectedCity = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("جميع المتبرعين"),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bloodType.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (cxt, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = selectIndex == index ? -1 : index;
                      });
                    },
                    child: new Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      width: 50,
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        // You can use like this way or like the below line
                        //borderRadius: new BorderRadius.circular(30.0),
                        color: index == selectIndex ? color : Colors.grey,
                      ),
                      child: Center(
                          child: Text(
                        bloodType[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DropdownButton<String>(
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
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text("ahmed bassiouny"),
                    subtitle: Text("01273144337"),
                    leading: CircleAvatar(
                      child: Text(
                        bloodType[index],
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: color,
                    ),
                    trailing: Text(
                      index % 2 == 0 ? "مجانى" : "مدفوع",
                      style: TextStyle(
                          color: index % 2 == 0 ? Colors.green : Colors.black),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
