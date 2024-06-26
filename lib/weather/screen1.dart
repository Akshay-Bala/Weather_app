import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather/screen2.dart';

class Screeen1 extends StatefulWidget {
  Screeen1({super.key});

  @override
  State<Screeen1> createState() => _Screeen1State();
}

class _Screeen1State extends State<Screeen1> {
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = isSwitched
        ? Color.fromRGBO(36, 91, 130, 1)
        : Color.fromRGBO(255, 255, 255, 1);
    Color backgroundColor = isSwitched
        ? Color.fromRGBO(204, 225, 244, 1)
        : Color.fromRGBO(40, 40, 40, 1);
    Color containerColor = isSwitched
        ? Color.fromRGBO(176, 188, 200, 1)
        : Color.fromRGBO(30, 31, 33, 1);
    Color appBarBackgroundColor = isSwitched
        ? Color.fromRGBO(204, 225, 244, 1)
        : Color.fromRGBO(42, 46, 46, 1);
    Color drawerBackgroundColor = isSwitched
        ? Color.fromRGBO(204, 225, 244, 1)
        : Color.fromRGBO(48, 48, 48, 1);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color.fromRGBO(255, 202, 45, 1),
        backgroundColor: appBarBackgroundColor,
        title: Text("Weather app",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w700)),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search,
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: drawerBackgroundColor,
        child: Container(
          color: drawerBackgroundColor,
          child: ListView(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen2(isDarkMode: isSwitched),
                    ),
                  );
                },
                child: Container(
                  child: ListTile(
                    leading: Icon(
                      Icons.history,
                      color: textColor,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "History",
                        style: GoogleFonts.quantico(
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  leading: Icon(
                    Icons.brightness_6_rounded,
                    color: textColor,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Light mode",
                      style: GoogleFonts.quantico(
                        color: textColor,
                      ),
                    ),
                  ),
                  trailing: Switch(
                    value: isSwitched,
                    onChanged: toggleSwitch,
                    activeColor: Colors.blue[200],
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: drawerBackgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "IN | Kottakkal",
                      style: GoogleFonts.poppins(
                        fontSize: 41,
                        fontWeight: FontWeight.w200,
                        color: textColor,
                      ),
                    ),
                    Text(
                      "Scattered clouds",
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "34\u00B0",
                      style: GoogleFonts.quantico(
                        fontSize: 90,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.cloud,
                      color: textColor,
                      size: 90,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: containerColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [
                      Column(
                        children: [
                          Icon(
                            Icons.thermostat,
                            color: textColor,
                            size: 50,
                          ),
                          Text(
                            "34\u00B0",
                            style: GoogleFonts.quantico(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              color: textColor,
                              size: 80,
                            ),
                            Text(
                              "49%",
                              style: GoogleFonts.quantico(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: textColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.air_outlined,
                            color: textColor,
                            size: 50,
                          ),
                          Text(
                            "3 km/h",
                            style: GoogleFonts.quantico(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                ),
              ),
              Center(
                  child: Text(
                "Today",
                style: TextStyle(
                    color: Color.fromRGBO(255, 202, 45, 1), fontSize: 20),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final item = dailyWeather[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  item['time'],
                                  style: GoogleFonts.quantico(
                                    color: textColor,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      item['degre'],
                                      style: GoogleFonts.quantico(
                                        color: textColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.cloud,
                                      color: textColor,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.water_drop,
                                          color: textColor,
                                        ),
                                        Text(
                                          item['water'],
                                          style: GoogleFonts.quantico(
                                            color: textColor,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.air,
                                          color: textColor,
                                        ),
                                        Text(
                                          item['air'],
                                          style: GoogleFonts.quantico(
                                            color: textColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  "Scattered clouds",
                                  style: GoogleFonts.quantico(
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                            height: 134,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: containerColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: dailyWeather.length,
                ),
              ),
              Center(
                  child: Text(
                "5 day Forecast",
                style: TextStyle(
                    color: Color.fromRGBO(255, 202, 45, 1), fontSize: 20),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(9),
                    ),
                    color: containerColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Wed',
                          style: GoogleFonts.quantico(
                            color: textColor,
                          ),
                        ),
                        Text(
                          '9 PM',
                          style: GoogleFonts.quantico(
                            color: textColor,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.cloud,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    Text(
                      '26\u00B0',
                      style: GoogleFonts.quantico(
                        color: textColor,
                      ),
                    ),
                    Text(
                      '26\u00B0',
                      style: GoogleFonts.quantico(
                        color: textColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> dailyWeather = [
  {"time": "09:00AM", "degre": "34\u00B0", "water": "49%", "air": "3km/h"},
  {"time": "12:00PM", "degre": "33\u00B0", "water": "49%", "air": "4km/h"},
  {"time": "04:00PM", "degre": "34\u00B0", "water": "45%", "air": "4km/h"},
  {"time": "07:00PM", "degre": "32\u00B0", "water": "44%", "air": "4km/h"},
  {"time": "09:00PM", "degre": "30\u00B0", "water": "49%", "air": "4km/h"},
];
