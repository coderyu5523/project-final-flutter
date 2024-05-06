import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_app/data/dtos/user/user_request.dart';
import 'package:project_app/data/store/global_store.dart';
import 'package:project_app/data/store/session_store.dart';

import '../../../_core/constants/move.dart';
import '../../../_core/constants/theme.dart';
import '../../_common/components/custom_scaffold.dart';

class JoinPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _checkPassword = TextEditingController();
  final _name = TextEditingController();
  var _birth;
  var _gender;
  var _height;
  DateTime? selectedDate; // 날짜
  String? selectedGender; // 성별
  String? selectedHeight; // 키
  bool _privacyPolicyAgreed = false;

  JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider); // 날짜 상태 관리
    final checkedBox = ref.watch(CheckedBoxProvider);

    void _showPrivacyPolicyDialog(context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("개인정보 처리방침"),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text("1. 개인정보의 수집 및 이용 목적"),
                Text("본 앱은 서비스 제공을 위해 다음과 같은 개인정보를 수집하고 있습니다."),
                Text(" - 이름, 연락처, 이메일, 생년월일 등"),
                Text("2. 개인정보의 보유 및 이용 기간"),
                Text("귀하의 개인정보는 서비스 이용기간 동안 보유하며, 목적 달성 후 즉시 파기합니다."),
                Text("3. 개인정보의 파기 절차 및 방법"),
                Text("사용자의 개인정보는 목적이 달성된 후 내부 방침 및 관련 법률에 따라 안전하게 파기됩니다."),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("닫기", style: TextStyle(color: Colors.teal)),
            ),
          ],
          backgroundColor: Colors.teal.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }

    return CustomScaffold(
      child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.8,
        maxChildSize: 1.0,
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('회원가입', style: textTheme().titleLarge),
                    const SizedBox(height: 40.0),
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
                    TextFormField(
                      controller: _checkPassword,
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
                                    onPrimary: Colors.white,
                                    onSurface: Colors.black,
                                  ),
                                  dialogBackgroundColor: Colors.white,
                                ),
                                child: child!,
                              );
                            });
                        if (picked != null && picked != selectedDate) {
                          // 여기에 생년월일 선택시 로직 작성
                          ref.read(selectedDateProvider.notifier).state =
                              picked;
                          _birth = picked.toIso8601String();

//                           setState(() {
//                             selectedDate = picked;
//                           });
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
                    DropdownButtonFormField<String>(
                      value: selectedGender,
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
                        // 여기에 성별 선택시 로직 작성
                        _gender = newValue;
//                         setState(() {
//                           selectedGender = newValue;
//                         });
                      },
                    ),
                    const SizedBox(height: 25.0),
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
                        print("newValue : ${newValue}");
                        _height = double.parse(newValue!);
//                         setState(() {
//                           selectedHeight = newValue;
//                         });
                      },
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      children: [
                        Checkbox(
                          value: ref.watch(CheckedBoxProvider),
                          onChanged: (bool? value) {
                            ref.read(CheckedBoxProvider.notifier).state = value!;
                            // setState(() {
                            //   _privacyPolicyAgreed = value!;
                            // });
                          },
                          activeColor: Colors.teal, // 체크박스 배경색을 Teal로 설정
                          checkColor: Colors.white, // 체크 마크 색상을 흰색으로 설정
                        ),
                        GestureDetector(
                          onTap: ()=>_showPrivacyPolicyDialog(context),
                          child: const Text(
                            '개인정보 처리 방침',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal),
                          ),
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print("_birth : ${_birth}");

                          if (_password.text == _checkPassword.text) {
                            JoinRequestDTO joinrequestDTO = JoinRequestDTO(
                                username: _username.text.trim(),
                                phone: _phone.text.trim(),
                                password: _password.text.trim(),
                                name: _name.text.trim(),
                                birth: _birth,
                                gender: _gender,
                                height: _height);
                            SessionStore sessionstore =
                                ref.read(sessionProvider);
                            sessionstore.join(joinrequestDTO);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("비밀번호가 일치하지 않습니다.")));
                          }

                          // Navigator.pushNamed(context, Move.loginPage);
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
