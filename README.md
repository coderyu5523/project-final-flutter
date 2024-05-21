# 1.바디키(건강 습관 관리 플랫폼)

![image](https://github.com/coderyu5523/project-final-flutter/assets/153602328/43997232-c0e8-4d70-969a-ab56c0411a9e)

## 참고앱
https://play.google.com/store/apps/details?id=com.amway.bodykeykorea&hl=ko&gl=US

## 백엔드 github
https://github.com/coderyu5523/project-final-spring


## 시연 영상
## PPT

## 팀원 소개

### Team-Leader
|                                                         이름                                                        |                     프로필 사진                     |       GitHub 주소        |
|:---------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------:|:--------팅
- 회원정보 수정 view
- 메인페이지 통신
- 목표 체중,체지방, 근육량 insert
- 현재 체중,체지방,근육량 insert
- 활동 메인 통신
- 활동 걸음 페이지 통신
- 활동 물마시기 페이지 통신
- 활동 나의 변화 페이지 통신
- workmanager 라이브러리 적용


## 김정수
- 테이블 설계
- 메인페이지 view
- 마이페이지 view
- 챌린지 페이지 통신
- 챌린지 상세보기 페이지 통신
- 진행중인 페이지 통신
- 설문조사 페이지 통신
- 식단 페이지 통신
- 식단 업로드
- 식단 삭제
- 식단 검색
- 상태 관리


## 장유진
- 테이블 설계
- 시작 페이지 view
- 로그인, 회원가입 페이지 view
- 활동 메인 페이지, 걸음수 상세페이지, 물 마시기 상세페이지 view
- 활동 식단 페이지, 식단 업로드 페이지 view
- 활동 나의 변화 페이지 view
- 챌린지 페이지 view
- 챌린지 상세 페이지, 진행중인 챌린지 상세 페이지 view
- 설문조사, 설문조사 상세 페이지 view
- 문의 view
- 전화걸기, 이메일보내기 적용(url_launcher)
- 만보기 적용(pedometer)
- 차트(fl_chart) 적용
- 프로그레스바(syncfusion_flutter_gauges) 적용
- 달력(calendar_agenda) 적용
- 활동 권한 설정(permission_handler)

<br>

# 5. 개발 환경
<span>
 <h3><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Eyes.png" width=30" /> IDE</h3>
 <img src="https://img.shields.io/badge/Android%20Studio-3DDC84.svg?style=for-the-badge&logo=android-studio&logoColor=white"/>

  <h3><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Eyes.png" width=30" /> FrameWork</h3>
  <img src="https://img.shields.io/badge/Flutter-02569B.svg?style=for-the-badge&logo=flutter&logoColor=white"/>

  <h3><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Eyes.png" width=30" /> DB</h3>
   <img src="https://img.shields.io/badge/H2-FFA500?style=for-the-badge&logo=H2&logoColor=white"/>
   <img src="https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white"/>
   
  <h3><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Eyes.png" width=30" /> 사용기술</h3>
<img src="https://img.shields.io/badge/Riverpod-42a5f5.svg?style=for-the-badge&logo=riverpod&logoColor=white"/>


  <h3><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Eyes.png" width=30" /> 언어</h3>
  <img src="https://img.shields.io/badge/Dart-0175C2.svg?style=for-the-badge&logo=dart&logoColor=white"/>

  <h3><img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Hand%20gestures/Eyes.png" width=30" /> 협업 툴</h3>
<img src="https://img.shields.io/badge/GIT-E44C30?style=for-the-badge&logo=git&logoColor=white"/>
<img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"/>



## 프로젝트 아키텍쳐 : MVVM 패턴
![image](https://github.com/coderyu5523/project-final-flutter/assets/153602328/6f986f0b-4df9-4f2b-9707-37fa255f8796)
- 뷰(View) : 사용자와 상호작용하고, ViewModel에 데이터 바인딩을 설정한다.
- 뷰모델(ViewModel) : 뷰의 요구사항을 받아서 모델과 상호작용한다.. 모델에서 데이터를 가져와 뷰에 제공하고, 뷰의 입력을 모델에 전달한다.
- 모델(Model) :  데이터와 비즈니스 로직을 관리하며, ViewModel의 요청에 따라 데이터를 제공하거나 업데이트한다.


## 테이블 설계
![image](https://github.com/coderyu5523/project-final-flutter/assets/153602328/ce6cf877-3b30-4e3b-84f4-0303ee579d16)

<br>

# 6. 협업 전략

### 회의
![image](https://github.com/coderyu5523/project-final-flutter/assets/153602328/f1be670c-8d1f-4375-a846-87a405a5b7f5)

- 매일 오전 15~30분 회의
- 카톡, 슬랙 메신저 활용
- 진행 상황 확인을 위해 google meet 활용

### GitHub
- Branch : 이니셜/패키지명/기능명 ex) rjs/welcome/login
- commit : 작업 내용에 대한 요약 담기
- comment : 문제를 겪은 부분 정리
- issue : 버그나 해결사항 올리기
  
### naming conventions [코드 컨밴션]
- 패키지 : 소문자, 도메인별 패키지 만들기
- 파일 : 소문자, 언더바(_) 사용
- 클래스/메서드/필드값 : 파스칼 표기법
- viewmodel : 각 페이지 별 viewmodel 작성성
