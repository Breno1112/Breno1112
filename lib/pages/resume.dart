import 'dart:convert';

import 'package:breno_cv/helpers/colorHelper.dart';
import 'package:breno_cv/pages/mobile/mobileResume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ResumeState();
}

class ResumeState extends State<Resume> {
  late Future<Map<String, dynamic>> contents;

  Future<Map<String, dynamic>> readContentsJson() async {
    final String contents = await rootBundle.loadString("contents.json");
    return await json.decode(contents);
  }

  @override
  void initState() {
    contents = readContentsJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Text("An error occurred!");
        } else {
          var data = snapshot.data;
          var query = MediaQuery.of(context);
          if (query.size.width <= 480) {
            return MobileResume(data: data);
          } else if (query.size.width > 480 && query.size.width <= 768) {
            return buildTabletScreen(data);
          } else {
            return buildExtraLargeScreen(data);
          }
        }
      },
      future: contents,
    );
  }

  Widget buildTabletScreen(Map<String, dynamic>? data) {
    return Container(
      color: Colors.green,
    );
  }

  Widget buildExtraLargeScreen(Map<String, dynamic>? data) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: const Color.fromRGBO(8, 12, 51, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        data?["name"],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              Container(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // List<Widget> buildLanguageWidgets(MediaQueryData query) {
  //   List<Widget> result = [];
  //   result.add(SizedBox(
  //     height: query.size.width * 0.2,
  //     width: query.size.width,
  //   ));
  //   result.add(Padding(
  //     padding: EdgeInsets.symmetric(horizontal: query.size.width * 0.32),
  //     child: const FittedBox(
  //       fit: BoxFit.cover,
  //       child: Text(
  //         "Languages",
  //         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   ));
  //   result.add(Row(
  //     children: [
  //       CircularProgressIndicator(
  //         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  //         value: 0.5,
  //       )
  //     ],
  //   ));
  //   return result;
  // }

}
