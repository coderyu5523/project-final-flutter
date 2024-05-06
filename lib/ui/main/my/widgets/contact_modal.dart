import 'package:flutter/material.dart';
import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/line.dart';
import '../../../../_core/constants/size.dart';
import 'inquiry_tab.dart';
import 'response_tab.dart';
import 'company_info.dart';
import 'contact_icons.dart';

class ContactModal extends StatelessWidget {
  const ContactModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120), // AppBar의 높이 조정
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(  // 뒤로가기 버튼 위치 조정
              padding: EdgeInsets.only(top: 25),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 35),  // 타이틀을 더 아래로 내립니다.
              child: Text('1:1 문의'),
            ),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: kAccentColor2,
              labelColor: kAccentColor2,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: '문의하기'),
                Tab(text: '답변 상태'),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  InquiryTab(),
                  ResponseTab(),
                ],
              ),
            ),
            line2,
            SizedBox(height: gap_sm),
            CompanyInfo(),
            ContactIcons(),
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ContactModal();
      },
    );
  }
}
