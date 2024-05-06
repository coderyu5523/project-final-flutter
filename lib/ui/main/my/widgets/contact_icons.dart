import 'package:flutter/material.dart';
import '../../../../_core/constants/constants.dart';
import '../../../../_core/utils/communication_util.dart';
import 'contact_modal.dart';

class ContactIcons extends StatelessWidget {
  const ContactIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.phone, color: kAccentColor2),
            onPressed: () => makePhoneCall('1234-5678'),
          ),
          IconButton(
            icon: Icon(Icons.email, color: kAccentColor2),
            onPressed: () => sendEmail('bodykey@company.com'),
          ),
          IconButton(
            icon: Icon(Icons.question_answer, color: kAccentColor2),
            onPressed: () {
              ContactModal.show(context);
            },
          ),
        ],
      ),
    );
  }
}