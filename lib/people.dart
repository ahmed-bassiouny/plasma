import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';
import 'package:plasma/api.dart';
import 'package:plasma/user.dart';
import 'package:plasma/utils.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  var bloodTypeIndex = -1;
  var _selectedCityIndex = -1;
  String _selectedCity = "";
  var isFinished = true;
  var list = List<User>();
  var page = 1;

  initState() {
    super.initState();
    page = 1;
    fetchData();
  }

  fetchData() async {
    var res = await Api.search(_selectedCityIndex, bloodTypeIndex,page);
    if (res.success) {
      setState(() {
        list.addAll(res.data.items);
        isFinished = (res.data.pagination.next_page_url == null || res.data.pagination.next_page_url.isEmpty);
      });
    }
  }

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
                        bloodTypeIndex = bloodTypeIndex == index ? -1 : index;
                        list = List<User>();
                        page = 1;
                        fetchData();
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
                        color: index == bloodTypeIndex ? color : Colors.grey,
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
                    _selectedCityIndex = cities.indexOf(value);
                    list = List<User>();
                    page = 1;
                    fetchData();
                  });
                },
              ),
            ),
            LoadMore(
              isFinish: isFinished,
              textBuilder: (f){
                if(f == LoadMoreStatus.nomore && page != 1){

                  return "";
                }else{
                  page ++;
                  return "جارى التحميل";
                }
              },
              onLoadMore: () async{
                fetchData();
                return isFinished;
              },
              child: ListView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text(list[index].name),
                      subtitle: Text(list[index].phone),
                      leading: CircleAvatar(
                        child: Text(
                          bloodType[list[index].bloodType],
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: color,
                      ),
                      trailing: Text(
                        list[index].free ? "مجانى" : "مدفوع",
                        style: TextStyle(
                            color: list[index].free ? Colors.green : Colors
                                .black),
                      ),
                    );
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
