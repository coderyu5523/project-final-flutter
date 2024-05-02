import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/user/user_request.dart';

import '../../../_core/constants/move.dart';
import '../../../_core/constants/theme.dart';
import '../../../data/store/session_store.dart';
import '../../_common/components/custom_scaffold.dart';

class JoinPage extends ConsumerWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final _username = TextEditingController();
    final _password = TextEditingController();
    final _name = TextEditingController();
    final _phone = TextEditingController();
    final _gender = TextEditingController();
    final _height = TextEditingController();

    DateTime? selectedDate; // 날짜
    String? selectedGender; // 성별
    String? selectedHeight; // 키

    return CustomScaffold(
      child: DraggableScrollableSheet(
        // 화면 크기 드래그 가능
        initialChildSize: 0.8, // 초기 드래그 크기 설정
        minChildSize: 0.8, // 최소 크기 설정
        maxChildSize: 1.0, // 최대 크기 설정
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
            child: SingleChildScrollView(
              controller: scrollController,
              // DraggableScrollableSheet에서 제공하는 ScrollController 사용
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 타이틀
                    Text(
                      '회원가입',
                      style: textTheme().titleLarge,
                    ),
                    const SizedBox(height: 40.0),
                    // 이름
                    TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        label: const Text('이름'),
                        hintText: '이름을 입력하세요',
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    // ID
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            controller: _username,
                            decoration: InputDecoration(
                              label: const Text('ID'),
                              hintText: 'ID를 입력하세요',
                              hintStyle: const TextStyle(color: Colors.black26),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // 중복 버튼
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('중복 확인'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    // 비밀번호
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text('비밀번호'),
                        hintText: '비밀번호를 입력하세요',
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    // 비밀번호 확인
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text('비밀번호 확인'),
                        hintText: '비밀번호를 다시 입력하세요',
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    //전화번호
                    TextFormField(
                      controller: _phone,
                      decoration: InputDecoration(
                        label: const Text('휴대폰번호'),
                        hintText: '휴대폰번호를 입력하세요',
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),

                    // 생년월일 달력
                    InkWell(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: selectedDate ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: Colors.teal,
                                    // header background color
                                    onPrimary: Colors.white,
                                    // header text color
                                    onSurface: Colors.black, // body text color
                                  ),
                                  dialogBackgroundColor: Colors
                                      .white, // background color of the dialog
                                ),
                                child: child!,
                              );
                            });
                        if (picked != null && picked != selectedDate) {
                          // 여기에 생년월일 선택시 로직 작성
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedDate == null
                                  ? '생년월일을 입력하세요'
                                  : '${selectedDate!.toLocal()}'.split(' ')[0],
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 16),
                            ),
                            const Icon(Icons.calendar_today,
                                color: Colors.teal),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    // 성별
                    DropdownButtonFormField<String>(
                      value: _gender.text.isNotEmpty ? _gender.text : null,
                      decoration: InputDecoration(
                        labelText: '성별',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: <String>['남', '여']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // 선택된 값이 변경될 때마다 TextEditingController에 업데이트
                        _gender.text = newValue ?? '';
                        // 여기에 선택된 값으로 로직 작성
                      },
                    ),

                    const SizedBox(height: 25.0),
                    // 키
                    DropdownButtonFormField<String>(
                      value: selectedHeight,
                      decoration: InputDecoration(
                        labelText: '키 (cm)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: List<String>.generate(
                              201, (index) => (50 + index).toString())
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // 여기에 키 선택시 로직 작성
                      },
                    ),
                    const SizedBox(height: 25.0),
                    // 개인정보처리방침
                    Row(
                      children: [
                        const Checkbox(value: true, onChanged: null),
                        const Text(
                          '개인정보 처리 방침',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.teal),
                        ),
                        Text(
                          '에 동의합니다',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    // 회원가입버튼
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          bool isOk = _formKey.currentState!.validate();
                          if (isOk) {
                            String username = _username.text.trim();
                            String password = _password.text.trim();
                            String phone = _phone.text.trim();
                            String name = _name.text.trim();
                            String gender = _gender.text.trim();

                            print(gender);

                            JoinRequestDTO joinRequestDTO = JoinRequestDTO(
                              username: username,
                              phone: phone,
                              password: password,
                              name: name,
                              gender: gender
                            );
                            SessionStore store = ref.read(sessionProvider);
                            store.join(joinRequestDTO);
                          }

                          Navigator.pushNamed(context, Move.loginPage);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('회원가입하기'),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.7,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '또는',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.7,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '이미 계정이 있으신가요? ',
                          style: TextStyle(color: Colors.black45),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Move.loginPage);
                          },
                          child: Text(
                            '로그인하기',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
