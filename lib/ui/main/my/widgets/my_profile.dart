import 'package:flutter/material.dart';
import 'package:project_app/_core/constants/constants.dart';
import 'package:project_app/_core/constants/size.dart';
import 'package:project_app/_core/constants/style.dart';
import 'package:project_app/ui/main/my/widgets/profile_edit_button.dart';
import 'package:project_app/ui/main/my/widgets/profile_image.dart';
import '../pages/profile_edit_page.dart';
import '../pages/survey_page.dart';
import 'contact_modal.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kAccentColor2,
      child: Container(
        margin: EdgeInsets.only(top: gap_xxxl, left: gap_m, right: gap_m, bottom: gap_m),
        decoration: BoxDecoration(
          color: TColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -40,
              child: ProfileImage(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "류재성님",
                      style: h6(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => ContactModal.show(context),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.question_answer, color: Colors.grey),
                            Text(
                              "문의하기",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("|", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SurveyPage()),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.poll, color: Colors.grey),
                            Text(
                              "설문조사",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: gap_l),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: ProfileEditButton(),
            ),
          ],
        ),
      ),
    );
  }
}