import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class CustomProgressBar extends StatelessWidget {
  final double progress;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final Color borderColor;
  final double borderRadius;

  CustomProgressBar({
    required this.progress,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.progressColor,
    required this.borderColor,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: width * progress,
            height: height,
            decoration: BoxDecoration(
              color: progressColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ],
      ),
    );
  }
}

class CourseContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final Widget image;
  final Color color;

  CourseContainer(
      {required this.title,
      required this.subtitle,
      required this.progress,
      required this.image,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 0, 10),
                child: Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: CustomProgressBar(
                  progress: progress,
                  width: 200.0,
                  height: 5.0,
                  backgroundColor: Colors.transparent,
                  progressColor: const Color.fromARGB(255, 255, 255, 255),
                  borderColor: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: 10.0,
                ),
              )
            ],
          ),
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: image),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Image(
                      image: AssetImage('images/Dots.png'),
                      width: 25,
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.blue[50],
                      ),
                      child: const Image(
                        image: AssetImage('images/Profile-image3.png'),
                        width: 75,
                        height: 75,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hey,\nTommy!",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Speak freely\nanywhare",
                      style: GoogleFonts.poppins(
                          fontSize: 30, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: const Color.fromARGB(255, 243, 243, 243),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[500]),
                      Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Find your course",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w400),
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Continue course",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: CourseContainer(
                        title: "Spanish\nLanguage",
                        subtitle: "40 lessons",
                        progress: 0.1,
                        image: const Image(
                          alignment: Alignment.bottomRight,
                          image: AssetImage('images/Profile-image1.png'),
                          width: 150,
                          height: 150,
                        ),
                        color: const Color.fromARGB(255, 255, 200, 159),
                      ),
                    ),
                    Container(
                      child: CourseContainer(
                        title: "Spanish\nLanguage",
                        subtitle: "120 lessons",
                        progress: 0.25,
                        image: const Image(
                          alignment: Alignment.bottomRight,
                          image: AssetImage('images/Profile-image2.png'),
                          width: 150,
                          height: 150,
                        ),
                        color: Color.fromARGB(255, 166, 177, 255),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
