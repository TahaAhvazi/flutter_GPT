import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AlertDialog(
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white,
              ),
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/Top.png"),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 30.0),
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        "With subscription, get over 500,000 words every month",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontFamily: "manrope700",
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          height: 48,
                          width: 200,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(61, 68, 246, 1),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: const Center(
                            child: Text(
                              "Subscribe Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "manrope400",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).size.height < 400
              ? MediaQuery.of(context).size.height * 30 / 100
              : MediaQuery.of(context).size.height * 28 / 100,
          right: MediaQuery.of(context).size.width > 600
              ? MediaQuery.of(context).size.width * 38 / 100
              : MediaQuery.of(context).size.width * 15 / 100,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.close,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
