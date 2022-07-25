import 'package:flutter/material.dart';

import '../../helpers/colorHelper.dart';

class MobileResumeWorkExperience extends StatelessWidget {
  const MobileResumeWorkExperience({Key? key}) : super(key: key);

  Widget bullet() {
    return Container(
      height: 5.0,
      width: 5.0,
      decoration: const BoxDecoration(
        color: ColorHelper.blueResumeColor,
        shape: BoxShape.circle,
      ),
    );
  }

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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Hero(
                tag: "mobile-resume-contents",
                child: Row(
                  children: const [
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          "Work experience",
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
                )),
            SizedBox(
              width: query.size.width,
              height: query.size.height * 0.1,
            ),
            const FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                "Software Engineer",
                style:
                    TextStyle(color: ColorHelper.blueResumeColor, fontSize: 20),
              ),
            ),
            SizedBox(
              height: query.size.height * 0.02,
            ),
            const FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                "Itaú Unibanco",
                style:
                    TextStyle(color: ColorHelper.blueResumeColor, fontSize: 15),
              ),
            ),
            SizedBox(
              height: query.size.height * 0.01,
            ),
            const FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                "2021 - Present",
                style:
                    TextStyle(color: ColorHelper.blueResumeColor, fontSize: 15),
              ),
            ),
            SizedBox(
              height: query.size.height * 0.02,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                bullet(),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Text(
                    "Develop web applications with Angular framework",
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    style: TextStyle(
                        color: ColorHelper.blueResumeColor, fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
