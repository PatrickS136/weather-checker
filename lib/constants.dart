import 'package:flutter/material.dart';
import 'config.dart';
import 'package:http/http.dart';
import 'dart:convert';

const Color blue = Color.fromRGBO(25, 149, 254, 1);
const Color lightBlue = Color.fromRGBO(116, 212, 251, 1);

const List<String> weekdays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];
const List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const kCityText = TextStyle(
  fontFamily: "Oswald",
  fontSize: 40,
  letterSpacing: 3,
);

const kDateText = TextStyle(
  fontFamily: "Oswald",
  fontSize: 20,
  letterSpacing: 3,
);

const kTempText = TextStyle(
  fontFamily: "Oswald",
  fontSize: 60,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
);

const kDescription = TextStyle(
  fontFamily: "Oswald",
  fontSize: 30,
  letterSpacing: 3,
);

class WeatherBrain {
  Future<Map<String, dynamic>> getWeather(String city) async {
    Map<String, dynamic> results = {};
    Uri uri = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
      "q": city,
      "appid": apiKey,
    });
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      results["id"] = decoded["weather"][0]["id"];
      results["icon"] = decoded["weather"][0]["icon"];
      results["description"] = decoded["weather"][0]["description"];
      results["temp"] = (decoded["main"]["temp"] - 273).toStringAsFixed(1);
      return results;
    } else {
      results["id"] = "800";
      results["icon"] = "10d";
      results["description"] = "Unknown location";
      results["temp"] = (273 - 273).toStringAsFixed(1);
      return results;
      // throw "Problem with the API get request";
    }
  }
}
