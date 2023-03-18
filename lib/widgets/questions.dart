import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Text(
          "Example of types of question to ask RealAssist",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "manrope700",
            fontSize: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
          child: Container(
            height: height * 9 / 100,
            width: width * 100 / 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 247,
                    child: Text(
                      "Creating blog content specific to real estate",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "manrope700",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Image.asset("assets/flash.png"),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            height: height * 9 / 100,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 247,
                    child: Text(
                      "Creating blog content specific to real estate",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "manrope700",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Image.asset("assets/flash.png"),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            height: height * 9 / 100,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 247,
                    child: Text(
                      "Creating email drip campaign content for your clients",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "manrope700",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Image.asset("assets/flash.png"),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Container(
            height: height * 9 / 100,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 247,
                    child: Text(
                      "Writing answers to your clients texts/emails",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "manrope700",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Image.asset("assets/flash.png"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
