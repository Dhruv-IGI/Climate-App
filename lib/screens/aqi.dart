import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Screen2 extends StatefulWidget {
  Screen2({this.locationWeather});
  final locationWeather;

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  double pm25, pm_10, so_2, no_2, o_3, c_o;
  int pm;
  String cityName, date, city;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        // temperature = 0;
        // icon = null;
        // mess = 'unable to get weather data';
        cityName = '';
        return;
      } else {
        pm_10 = weatherData['current']['air_quality']['pm10'];
        so_2 = weatherData['current']['air_quality']['so2'];
        no_2 = weatherData['current']['air_quality']['no2'];
        o_3 = weatherData['current']['air_quality']['o3'];
        c_o = weatherData['current']['air_quality']['co'];
        pm25 = weatherData['current']['air_quality']['pm2_5'];
        pm = pm25.toInt();
        date = weatherData['current']['last_updated'];
        pm25 = double.parse((pm25).toStringAsFixed(1));
        pm_10 = double.parse((pm_10).toStringAsFixed(1));
        so_2 = double.parse((so_2).toStringAsFixed(1));
        no_2 = double.parse((no_2).toStringAsFixed(1));
        o_3 = double.parse((o_3).toStringAsFixed(1));
        c_o = double.parse((c_o).toStringAsFixed(1));
        cityName = weatherData['location']['name'];
        city = weatherData['location']['region'];
      }
    });
  }

  String url = 'https://aqicn.org/city/';

  void _launchURL() async {
    if (!await launch("$url$city")) throw 'Could not launch $url$city';
  }

  int ppm = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  ElevatedButton(
                    child: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xFF302F31).withOpacity(1)),
                      elevation: MaterialStateProperty.all<double>(0),
                      // shadowColor: Colors.transparent,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Air Quality Index",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                child: Row(
                  children: [
                    Text(
                      "$cityName Published at $date",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$pm",
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w300,
                        color: pm < 50 ? Colors.green : Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 11.0),
                      child: Text(
                        pm < 50 ? "   Good" : "   Unhealthy",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          color: pm < 50 ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                child: Row(
                  children: [
                    Text(
                      pm < 50
                          ? "Air quality is good.A perfect day for a walk!"
                          : "Air is polluted. It can harmful to sensitive groups.",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$pm25",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: pm < 50 ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("PM2.5"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$pm_10",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: pm_10 < 50 ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("PM10"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$so_2",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: so_2 < 50 ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("SO2"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$no_2",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: no_2 < 50 ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("NO2"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$o_3",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: o_3 < 60 ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("O3"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$c_o",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: c_o < 50 ? Colors.green : Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text("CO"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xFF302F31).withOpacity(1)),
                    elevation: MaterialStateProperty.all<double>(0),
                    // shadowColor: Colors.transparent,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: _launchURL,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "More on air quality",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w400),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
