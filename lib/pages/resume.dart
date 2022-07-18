import 'package:breno_cv/helpers/colorHelper.dart';
import 'package:flutter/material.dart';

class Resume extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResumeState();
}

class ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: ColorHelper.blueResumeColor,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
