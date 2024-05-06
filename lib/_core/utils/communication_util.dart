import 'package:url_launcher/url_launcher.dart';

// 전화 걸기 기능
void makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  try {
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      print('Cannot launch $launchUri');
    }
  } catch (e) {
    print('Error launching $launchUri: $e');
  }
}

// 이메일 보내기 기능
void sendEmail(String email) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': '문의 드립니다',
      'body': '문의 드립니다',
    },
  );
  try {
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      print('Cannot launch $emailLaunchUri');
    }
  } catch (e) {
    print('Error launching $emailLaunchUri: $e');
  }
}
