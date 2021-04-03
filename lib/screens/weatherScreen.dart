import 'package:flutter/material.dart';
import 'package:weather_checker/constants.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:weather_checker/screens/searchScreen.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String location = "Jakarta";
  DateTime now = new DateTime.now();
  // DateTime date = new DateTime(now.year, now.month, now.day);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Center(
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Weather",
                  style: kCityText,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Icon(Icons.wb_sunny, size: 160),
              SizedBox(
                height: 20,
              ),
              Text(
                location,
                style: kCityText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Monday, 1 January 2021",
                style: kDateText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GradientText(
                  text: "37°C",
                  style: kTempText,
                  colors: <Color>[blue, lightBlue],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SearchScreen(),
          );
        },
        elevation: 5,
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }
}
