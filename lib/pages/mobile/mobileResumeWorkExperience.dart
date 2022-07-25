import 'package:flutter/material.dart';

import '../../helpers/colorHelper.dart';

class MobileResumeWorkExperience extends StatelessWidget {
  const MobileResumeWorkExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: ColorHelper.blueResumeColor),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              Hero(
                  tag: "mobile-resume-contents",
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(
                      children: const [
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "Education",
                              style: TextStyle(
                                  color: ColorHelper.blueResumeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                width: query.size.width,
                height: query.size.height * 0.1,
              ),
              Row(
                children: [
                  Text(
                    ".",
                    style: TextStyle(fontSize: 80),
                  )
                ],
              ),
              Row(
                children: [
                  VerticalDivider(
                    thickness: 2,
                    color: ColorHelper.blueResumeColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
