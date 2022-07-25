import 'package:flutter/material.dart';

import '../../helpers/colorHelper.dart';

class MobileResumeWorkExperience extends StatelessWidget {
  const MobileResumeWorkExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorHelper.blueResumeColor),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Hero(
                  tag: "work-experience",
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      "Work Experience",
                      style: TextStyle(color: ColorHelper.blueResumeColor),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
