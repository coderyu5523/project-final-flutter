import 'package:flutter/material.dart';
import '../../../../_core/constants/constants.dart';

class InquiryTab extends StatelessWidget {
  const InquiryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '문의 제목',
            style: TextStyle(
              color: TColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: '문의 제목을 입력해 주세요',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kAccentColor2),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            '문의 내용',
            style: TextStyle(
              color: TColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: '문의 내용을 입력해 주세요',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kAccentColor2),
              ),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccentColor2,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    '취소하기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccentColor2,
                  ),
                  onPressed: () {
                    // 등록 로직 구현
                    Navigator.pop(context);
                  },
                  child: Text(
                    '등록하기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
