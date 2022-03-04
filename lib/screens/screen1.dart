import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              SizedBox(height: 125.0),
              Icon(
                MaterialCommunityIcons.sign_caution,
                size: 300.0,
                // color: Color(0xFFdcdee0),
                // color: Colors.red,
                color: Color(0xFF9c9998),
              ),
              Text(
                "This section is still being built out.",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF9c9998),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
