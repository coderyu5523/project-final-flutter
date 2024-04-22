import 'package:flutter/material.dart';
import 'package:project_app/style.dart';

class MissionContainer extends StatelessWidget {
  final title;
  final title2;
  final subtitle;
  final icons;

  MissionContainer(
      {this.title = "",
      this.title2 = "",
      required this.subtitle,
      required this.icons});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${title}",
                        style: h5(),
                      ),
                      TextSpan(
                        text: "${title2}",
                        style: h6(mColor: Colors.grey[600]!),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${subtitle}",
                  style: subtitle2(),
                ),
              ],
            ),
            Spacer(),
            Icon(
              icons,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}