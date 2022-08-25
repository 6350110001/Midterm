import 'package:bmi_usethis/bmiModel.dart';
import 'package:bmi_usethis/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;
  var height = TextEditingController();
  var weight = TextEditingController();

  double _bmi = 0;

  late BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset(
                  "assets/images/heart.svg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "BMI Calculator",
                style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "We care about your health",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Height (cm)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: height,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow((RegExp("[.0-9]"))),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Weight (kg)",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                  controller: weight,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow((RegExp("[.0-9]"))),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Colors.pink),
                  onPressed: () {
                    setState(() {
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comments: 'You are Totaly Fit');
                      } else if (_bmi < 18.5) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: 'You are Underweighted');
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: 'You are Overweighted');
                      } else {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comments: 'You are Obesed');
                      }
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResultScreen(bmiModel: _bmiModel)));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  label: Text("CALCULATE"),

                  //ใส่สีปุ่ม เป็นสีชมพู
                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),

              )
            ],
          ),

        ),
      ),
    );
  }
}
