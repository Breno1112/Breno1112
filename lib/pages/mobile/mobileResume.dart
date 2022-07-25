import 'package:breno_cv/pages/mobile/mobileResumeWorkExperience.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/colorHelper.dart';

class MobileResume extends StatefulWidget {
  final Map<String, dynamic>? data;
  const MobileResume({super.key, this.data});
  @override
  State<StatefulWidget> createState() => MobileResumeState();
}

class MobileResumeState extends State<MobileResume> {
  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    return Container(
      color: ColorHelper.blueResumeColor,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: getMobileWidgetList(query, widget.data),
      ),
    );
  }

  List<Widget> getMobileWidgetList(
      MediaQueryData query, Map<String, dynamic>? data) {
    List<Widget> result = [
      SizedBox(
        width: query.size.width * 0.4,
        height: query.size.height * 0.4,
        child: CircleAvatar(
          radius: 1,
          backgroundImage: AssetImage(data?["profile_image"]),
        ),
      ),
      SizedBox(
        height: query.size.width * 0.1,
        width: query.size.width,
      ),
      FittedBox(
        fit: BoxFit.cover,
        child: Text(
          data?["name"],
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: query.size.width * 0.1,
        width: query.size.width,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: query.size.width * 0.1),
        child: SizedBox(
          height: query.size.height * 0.05,
          width: query.size.width,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              data?["profession_shortname"],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      SizedBox(
        height: query.size.width * 0.1,
        width: query.size.width,
      ),
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: data?["short_description"],
            style: const TextStyle(color: Colors.white, fontSize: 20)),
      ),
      SizedBox(
        height: query.size.width * 0.2,
        width: query.size.width,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: query.size.width * 0.2),
        child: const FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "Contact me",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(
        height: query.size.width * 0.1,
        width: query.size.width,
      ),
      GestureDetector(
        onTap: () => sendMail(widget.data?["email"]),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.email_outlined,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 7,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  data?["email"],
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: query.size.width * 0.1,
        width: query.size.width,
      ),
      GestureDetector(
        onTap: () => callMe(widget.data?["phone"]),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.phone_outlined,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 7,
              child: Text(
                data?["phone"],
                style: const TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: query.size.width * 0.1,
        width: query.size.width,
      ),
      GestureDetector(
        onDoubleTap: () => openWebsite(widget.data?["website"]),
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                IconData(0xf68d,
                    fontFamily: CupertinoIcons.iconFont,
                    fontPackage: CupertinoIcons.iconFontPackage), //globe icon
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 7,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  widget.data?["website"],
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.start,
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: query.size.width * 0.2,
        width: query.size.width,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: query.size.width * 0.32),
        child: const FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "Skills",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(
        height: query.size.width * 0.1,
        width: query.size.width,
      ),
    ];
    var skillWidgetList = buildWidgetSkills(query, widget.data?["skills"]);
    for (var element in skillWidgetList) {
      result.add(element);
    }
    result.add(SizedBox(
      height: query.size.width * 0.2,
      width: query.size.width,
    ));
    result.add(SizedBox(
      width: query.size.width,
      height: query.size.height * 0.07,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
          ),
          onPressed: () => showWorkExperience(),
          child: const Hero(
              tag: "work-experience",
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "View work Experience",
                  style: TextStyle(color: ColorHelper.blueResumeColor),
                ),
              ))),
    ));
    return result;
  }

  sendMail(String email) async {
    await launchUrl(Uri.parse("mailto:$email"));
  }

  callMe(String phone) async {
    await launchUrl(Uri.parse("tel:$phone"));
  }

  openWebsite(String website) async {
    await launchUrl(Uri.parse(website));
  }

  List<Widget> buildWidgetSkills(MediaQueryData query, dynamic e) {
    List<dynamic> l = List<dynamic>.from(e);
    List<Map<String, dynamic>> skills = [];
    for (var element in l) {
      Map<String, dynamic> m = Map<String, dynamic>.from(element);
      skills.add(m);
    }
    List<Widget> result = [];
    for (int idx = 0; idx < skills.length; idx++) {
      result.add(Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: Text(
                  skills[idx]["name"],
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(20)),
              child: LinearProgressIndicator(
                value: skills[idx]["value"],
                color: Colors.white,
                backgroundColor:
                    ColorHelper.skillProgressIndicatorBackgroundColor,
                minHeight: 10,
              ),
            ),
          )
        ],
      ));
      if (idx < skills.length - 1) {
        result.add(SizedBox(
          height: query.size.width * 0.1,
          width: query.size.width,
        ));
      }
    }
    return result;
  }

  showWorkExperience() {
    Route route = PageRouteBuilder(
        pageBuilder: ((context, animation, secondaryAnimation) =>
            const MobileResumeWorkExperience()),
        transitionsBuilder: ((context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }));
    Navigator.push(context, route);
  }
}
