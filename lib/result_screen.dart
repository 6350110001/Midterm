import 'package:bmi_usethis/bmiModel.dart';
import 'package:bmi_usethis/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  ResultScreen({this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            child: bmiModel.isNormal
                ? SvgPicture.asset(
                    "assets/images/happy.svg",
                    fit: BoxFit.contain,
                  )
                : SvgPicture.asset(
                    "assets/images/sad.svg",
                    fit: BoxFit.contain,
                  ),
          ),

          SizedBox(
            height: 8,
          ),
          Text(
            'Your BMI is ${bmiModel.bmi.round()}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 34,
              color: Colors.red[700],
            ),
          ),
          Text(
            bmiModel.comments.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.grey[700],
            ),
          ),

          SizedBox(
            height: 16,
          ),

          Text(
            bmiModel.isNormal
                ? 'Hurray! Your BMI is Normal.'
                : 'Sadly! Your BMI is not Normal.',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.red[700],
            ),
          ),
          //โดยใช้วิธีการกำหนดเงื่อนไขของ bmiModel.isNormal ดูตัวอย่าง บรรทัดที่ 24 ด้านบน
          SizedBox(
            height: 16,
          ),

          Container(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Colors.pink),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomePage(title: 'Flutter Demo');
                }));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              label: Text("LET CALCULATE AGAIN"),

            ),
            width: double.infinity,
            padding: EdgeInsets.only(left: 16, right: 16),
          )
        ],
      ),
    ));
  }
}
