import 'package:flutter/material.dart';
import 'package:weather_checker/constants.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:weather_checker/screens/searchScreen.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String location = "JAKARTA";
  String date = "Loading...";
  String imageURL = 'https://openweathermap.org/img/wn/10d@2x.png';
  Map<String, dynamic> results = {
    "temp": "Loading...",
    "icon": "Loading...",
    "id": "Loading...",
    "description": "Loading...",
  };

  void setDate() {
    setState(() {
      DateTime now = new DateTime.now();
      date =
          "${weekdays[now.weekday - 1]}, ${now.day} ${months[now.month - 1]} ${now.year}";
    });
  }

  void setLocation(newLocation) {
    setState(() {
      location = newLocation;
      getWeather(location);
    });
  }

  void getWeather(String city) async {
    print("Attempting to get weather data");
    dynamic newResults = await WeatherBrain().getWeather(location);
    setState(() {
      results = newResults;
      imageURL = 'https://openweathermap.org/img/wn/${results["icon"]}@2x.png';
    });
    print("Got weather data");
    print(results);
  }

  @override
  void initState() {
    super.initState();
    setDate();
    getWeather(location);
  }

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
                  results["description"].toUpperCase(),
                  style: kDescription,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.lightBlueAccent,
                child: Image.network(
                  imageURL,
                  scale: 0.5,
                ),
              ),
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
                date,
                style: kDateText,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GradientText(
                  text: "${results["temp"]}°C",
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
            builder: (context) => SearchScreen(setLocation: setLocation),
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
