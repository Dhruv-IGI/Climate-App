import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:ui';
import 'aqi.dart';
import 'screen1.dart';
import 'testing.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  String cityName, icon, text, mess, type, wind_d;
  int condition, humidity, pm;
  double realFeel, precip, pressure, wind, uv, visibility, pm25;
  int temperature;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        icon = null;
        mess = 'unable to get weather data';
        cityName = '';
        return;
      } else {
        pm25 = weatherData['current']['air_quality']['pm2_5'];
        pm = pm25.toInt();
        visibility = weatherData['current']['vis_km'];
        uv = weatherData['current']['uv'];
        wind = weatherData['current']['wind_mph'];
        pressure = weatherData['current']['pressure_mb'];
        precip = weatherData['current']['precip_mm'];
        realFeel = weatherData['current']['feelslike_c'];
        humidity = weatherData['current']['humidity'];
        wind_d = weatherData['current']['wind_dir'];
        cityName = weatherData['location']['name'];
        print("$cityName");
        condition = weatherData['current']['condition']['code'];
        icon = weatherData['current']['condition']['icon'];
        text = weatherData['current']['condition']['text'];
        double temp = weatherData['current']['temp_c'];
        temperature = temp.toInt();
        mess = weather.getMessage(temperature);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Ionicons.ios_add,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Screen1();
                          },
                        ),
                      );
                    },
                  ),

                  Text(
                    "$cityName",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  IconButton(
                    icon: Icon(
                      Entypo.dots_three_vertical,
                      size: 20.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Testing();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "$temperature",
                        style: TextStyle(
                          fontSize: 80.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 7.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '°C',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$text",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Row(
                      children: [
                        Icon(
                          Icons.masks,
                          size: 20.0,
                        ),
                        Text("  AQI $pm".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFFbfbfbf).withOpacity(0.2)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Screen2(
                                locationWeather: widget.locationWeather);
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFbfbfbf).withOpacity(0.1),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Real feel",
                                style: TextStyle(
                                    color: Color(0xFFbfbfbf).withOpacity(1)),
                              ),
                              Text(
                                "$realFeel °C",
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "Precipitation",
                                style: TextStyle(
                                    color: Color(0xFFbfbfbf).withOpacity(1)),
                              ),
                              Text(
                                "$precip mm",
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "Wind Speed",
                                style: TextStyle(
                                    color: Color(0xFFbfbfbf).withOpacity(1)),
                              ),
                              Text(
                                "$wind km/h",
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "Wind direction",
                                style: TextStyle(
                                    color: Color(0xFFbfbfbf).withOpacity(1)),
                              ),
                              Text(
                                "$wind_d",
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Humidity",
                                style: TextStyle(
                                    color: Color(0xFFbfbfbf).withOpacity(1)),
                              ),
                              Text(
                                "$humidity %",
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "Pressure",
                                style: TextStyle(
                                    color: Color(0xFFbfbfbf).withOpacity(1)),
                              ),
                              Text(
                                "$pressure mb",
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "UV index",
                                style: TextStyle(
                                    color: Color(0xFFbfbfbf).withOpacity(1)),
                              ),
                              Text(
                                "$uv",
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                "Visibility",
                                style: TextStyle(
                                    color: Color(0xFFbfbfbf).withOpacity(1)),
                              ),
                              Text(
                                "$visibility km",
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Data provided in part by ",
                      style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xFFbfbfbf).withOpacity(0.5)),
                    ),
                    Text("🔅WeatherAPI"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
