import 'package:flutter/material.dart';
import 'package:weather_checker/constants.dart';

class SearchScreen extends StatelessWidget {
  // String
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ListView(
          children: [
            Text(
              'Enter location',
              textAlign: TextAlign.center,
              style: kDateText.copyWith(color: blue),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: null,
            ),
            TextButton(
              child: Text(
                'Search',
                style: kDateText.copyWith(color: blue),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
