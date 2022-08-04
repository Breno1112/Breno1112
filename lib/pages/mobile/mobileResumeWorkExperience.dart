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
    result.add(SizedBox(
      height: query.size.height * 0.1,
    ));
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
                controller: ScrollController(),
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
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Work experience",
                        style: TextStyle(
                            fontSize: 50,
                            color: ColorHelper.blueResumeColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
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
      result.addAll(buildSection(query, "Awards"));
      widget.data?["awards"].forEach((element) => {
            result.addAll(buildSectionData(
                query,
                element["name"],
                element["company_name"],
                buildPeriodString(element["start_date"], null)))
          });
      result.addAll(buildSection(query, "Education"));
      widget.data?["education"].forEach((element) =>
          {result.addAll(buildSingleEducationSection(query, element))});
      result.addAll(buildSection(query, "Languages"));
      result.addAll(buildLanguages(query, widget.data?["languages"], 2));
      return result;
    });
  }

  String buildPeriodString(String? startDate, String? endDate) {
    if (startDate == null && endDate == null) {
      return "";
    } else if (startDate != null && endDate == null) {
      var start = DateTime.parse(startDate);
      return DateFormat("yyyy/MM").format(start);
    } else if (startDate == null && endDate != null) {
      var end = DateTime.parse(endDate);
      return DateFormat("yyyy/MM").format(end);
    } else {
      var start = DateTime.parse(startDate!);
      var end = DateTime.parse(endDate!);
      return "${DateFormat("yyyy/MM").format(start)} - ${DateFormat("yyyy/MM").format(end)}";
    }
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
      SizedBox(
        height: query.size.height * 0.1,
      )
    ];
  }

  List<Widget> buildSection(MediaQueryData query, String name) {
    return [
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
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 50,
                      color: ColorHelper.blueResumeColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        width: query.size.width,
        height: query.size.height * 0.1,
      )
    ];
  }

  List<Widget> buildLanguages(
      MediaQueryData query, List<dynamic>? data, int maxItemsInRow) {
    List<Widget> result = [];
    if (data == null) {
      return [];
    }
    int numOfRows = (data.length / maxItemsInRow).floor();
    if (data.length % maxItemsInRow > 0) {
      numOfRows++;
    }
    for (var x = 0; x < numOfRows; x++) {
      List<Widget> rowWidget = [];
      Row r = Row(
        children: rowWidget,
      );
      for (var y = 0; y < maxItemsInRow; y++) {
        if (x * maxItemsInRow + y < data.length) {
          rowWidget.add(buildSingleLanguageTermometerItem(
              query, data[x * maxItemsInRow + y]));
        } else {
          rowWidget.add(rowSpacing());
        }
      }
      result.add(r);
      result.add(SizedBox(
        width: query.size.width,
        height: query.size.height * 0.05,
      ));
    }
    return result;
  }

  Widget buildSingleLanguageTermometer(
      MediaQueryData query, String languageName, double value) {
    return Stack(
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: CircularProgressIndicator(
            value: value / 2,
            valueColor: const AlwaysStoppedAnimation<Color>(
                ColorHelper.blueResumeColor),
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Text(
            languageName,
            style: const TextStyle(fontSize: 6),
          ),
        )
      ],
    );
  }

  Widget buildSingleLanguageTermometerItem(
      MediaQueryData query, Map<String, dynamic> data) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: query.size.width,
          height: query.size.height * 0.2,
          child: FittedBox(
            fit: BoxFit.contain,
            child: buildSingleLanguageTermometer(
                query, data["name"], data["level"]),
          ),
        ),
      ),
    );
  }

  Widget rowSpacing() {
    return const Expanded(
      flex: 1,
      child: SizedBox(),
    );
  }

  List<Widget> buildSectionData(
      MediaQueryData query, String title, String locationName, String date) {
    return [
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          title,
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
          locationName,
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
          date,
          style:
              const TextStyle(color: ColorHelper.blueResumeColor, fontSize: 15),
        ),
      ),
      SizedBox(
        height: query.size.height * 0.1,
      )
    ];
  }
}
