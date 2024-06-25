import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather/screen1.dart';

class Screen2 extends StatelessWidget {
  final bool isDarkMode;

  Screen2({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color appBarBackgroundColor = isDarkMode
        ? Color.fromRGBO(176, 188, 200, 1)
        : Color.fromRGBO(42, 46, 46, 1);
    Color containerColor = isDarkMode
        ? Color.fromRGBO(176, 188, 200, 1)
        : Color.fromRGBO(30, 31, 33, 1);
    Color textColor =
        isDarkMode ? Color.fromRGBO(36, 91, 130, 1) : Colors.white;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(30, 153),
        child: AppBar(
          foregroundColor: Color.fromRGBO(255, 202, 45, 1),
          backgroundColor: appBarBackgroundColor,
          title: Text(
            "History",
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        color: isDarkMode
            ? Color.fromRGBO(213, 230, 246, 1)
            : Color.fromRGBO(42, 46, 46, 1),
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: containerColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "Wednesday",
                            style: GoogleFonts.poppins(
                              color: textColor,
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "India",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "8:37 AM",
                            style: GoogleFonts.poppins(
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
