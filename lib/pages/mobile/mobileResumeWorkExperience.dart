import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../helpers/colorHelper.dart';

class MobileResumeContents extends StatefulWidget {
  final Map<String, dynamic>? data;
  const MobileResumeContents({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MobileResumeContentsState();
}

class MobileResumeContentsState extends State<MobileResumeContents> {
  late MediaQueryData mainQuery;
  List<Widget> buildSingleWorkExperience(
      MediaQueryData query, Map<String, dynamic> data) {
    List<Widget> result = [
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          data["job_title"],
          style:
              const TextStyle(color: ColorHelper.blueResumeColor, fontSize: 20),
        ),
      ),
      SizedBox(
        height: query.size.height * 0.02,
      ),
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          data["company_name"],
          style:
              const TextStyle(color: ColorHelper.blueResumeColor, fontSize: 15),
        ),
      ),
      SizedBox(
        height: query.size.height * 0.01,
      ),
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          buildPeriodString(data["start_date"], data["end_date"]),
          style:
              const TextStyle(color: ColorHelper.blueResumeColor, fontSize: 15),
        ),
      ),
      SizedBox(
        height: query.size.height * 0.02,
      ),
    ];
    data["tasks"].forEach(
        (element) => {result.add(buildSingleDescription(true, element))});
    return result;
  }

  Widget buildSingleDescription(bool use_bullet, String description) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        bullet(),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            description,
            textAlign: TextAlign.justify,
            maxLines: 3,
            style: const TextStyle(
                color: ColorHelper.blueResumeColor, fontSize: 15),
          ),
        )
      ],
    );
  }

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
    mainQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: ColorHelper.blueResumeColor),
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: buildScreen(mainQuery),
          builder:
              ((BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator(
                color: ColorHelper.blueResumeColor,
              );
            } else {
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: snapshot.data!,
              );
            }
          }),
        ),
      ),
    );
  }

  Future<List<Widget>> buildScreen(query) {
    return Future(() {
      List<Widget> result = [
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
      ];
      List<dynamic> l = widget.data?["work_experience"];
      List<Map<String, dynamic>> workExperience = [];
      for (var element in l) {
        Map<String, dynamic> toInsert = Map<String, dynamic>.from(element);
        workExperience.add(toInsert);
      }
      for (var element in workExperience) {
        result.addAll(buildSingleWorkExperience(query, element));
      }
      result.addAll([
        SizedBox(
          width: query.size.width,
          height: query.size.height * 0.05,
        ),
        SizedBox(
          width: query.size.width,
          child: const Divider(
            color: ColorHelper.blueResumeColor,
            thickness: 2,
          ),
        ),
        SizedBox(
          width: query.size.width,
          height: query.size.height * 0.05,
        ),
        Row(
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
        SizedBox(
          width: query.size.width,
          height: query.size.height * 0.1,
        )
      ]);
      widget.data?["education"].forEach((element) =>
          {result.addAll(buildSingleEducationSection(query, element))});
      return result;
    });
  }

  String buildPeriodString(String start_date, String end_date) {
    var start = DateTime.parse(start_date);
    var end = DateTime.parse(end_date);
    return "${DateFormat("yyyy/MM").format(start)} - ${DateFormat("yyyy/MM").format(end)}";
  }

  List<Widget> buildSingleEducationSection(
      MediaQueryData query, Map<String, dynamic> data) {
    return [
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          data["type"],
          style:
              const TextStyle(color: ColorHelper.blueResumeColor, fontSize: 20),
        ),
      ),
      SizedBox(
        height: query.size.height * 0.02,
      ),
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          data["school_name"],
          style:
              const TextStyle(color: ColorHelper.blueResumeColor, fontSize: 15),
        ),
      ),
      SizedBox(
        height: query.size.height * 0.01,
      ),
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          buildPeriodString(data["start_date"], data["end_date"]),
          style:
              const TextStyle(color: ColorHelper.blueResumeColor, fontSize: 15),
        ),
      ),
    ];
  }
}
