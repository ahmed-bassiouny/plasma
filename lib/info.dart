import 'package:flutter/material.dart';
import 'package:plasma/utils.dart';

class InfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("كيفية التبرع بالبلازما بأمان"),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: color,
                    ),
                    child: Text(
                      "1",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      " تأكد من أنك تتبرع بالبلازما فى مركز معتمد.",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  )
                ],
              ),
              Divider(),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: color,
                    ),
                    child: Text(
                      "2",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      " مراقبة عدد المرات التي تتبرع بها: يمكنك التبرع بالبلازما كل 28 يوما، وتصل إلى 13 مرة في السنة، وتستغرق العملية بأكملها حوالي ساعة و15 دقيقة.",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  )
                ],
              ),
              Divider(),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      // You can use like this way or like the below line
                      //borderRadius: new BorderRadius.circular(30.0),
                      color: color,
                    ),
                    child: Text(
                      "3",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "تناول كمية مناسبة من الماء قبل التبرع، لأن هذا يمكن أن يساعد على منع الدوخة، والإغماء، والتعب، وبعض من الآثار الجانبية الأكثر شيوعا المرتبطة بالتبرع بالبلازما.",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
