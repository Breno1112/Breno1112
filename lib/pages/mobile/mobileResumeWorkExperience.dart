import 'package:flutter/material.dart';

import '../../helpers/colorHelper.dart';

class MobileResumeWorkExperience extends StatelessWidget {
  const MobileResumeWorkExperience({Key? key}) : super(key: key);

  Widget bullet() {
    return Container(
        height: 10.0,
        width: 10.0,
        decoration: const BoxDecoration(
          color: ColorHelper.blueResumeColor,
          shape: BoxShape.circle,
        ));
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                  child: bullet(),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: query.size.height * 0.1,
                  child: VerticalDivider(
                    thickness: 2,
                    color: ColorHelper.blueResumeColor,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2.5, 0, 0, 0),
                  child: bullet(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
