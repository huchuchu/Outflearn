# Outflearn ( KH_academy_Qclass_Finalproject )

앱 이름 : Outflearn
팀원 : 위성빈, 강선웅, 문희수, 송윤회, __유슬기(유다현)__

# TARGET

실시간 교육방속 및 다양한 IT 교육 영상 프로그램을 사용에게 제공한다.

 - 코딩을 처음 접하는 사람에게 자신의 수준에 맞는 강의를 선택하여 들을 수 있게한다.
 - 실시간 온라인 강의를 통해, 자신의 의문점을 즉시 해결할 수 있는 기회를 제공한다.
 - 자신의 강의를 업로드 하고, 수강생에 대한 질답을 통해 지식 공유에 기영할 수 있다.

# USAGE

 - 간단한 회원가입 ( SNS를 포한한 ) 을 거쳐 아웃프런의 유용한 기능들을 사용할 수 있다.
 - 유저들은 저렴한 가격으로 제공되는 강의를 결제하여 시청 할 수 있다.
 - 복잡하지 않은 과정을 거쳐 강사가 되고, 자신만의 강좌를 열어 기여할 수 있다.
 - 강사는 LIVE를 통해 실시간으로 자신의 강의를 이어갈 수 있으며, LIVE 방송의 채팅을 통해 학생들과 실시간으로 질문과 답변이 오고 갈 수 있다.
 
# TOOL

 - 구현 언어 : Java, Java Scrpit, jQuery, HTML5, CSS3, Jsp/Sevlet
 - 사용 기술 : Ajax, 결제 API ( kakao ), 로그인 API ( kakao, google ), webRTC API
 - 사용 도구 : Eclipse, Oracle11g, Visual Studio Code, MyBatis, Spring, BootStrap3

# ERD
![캡처](https://user-images.githubusercontent.com/58330668/108584198-bc7a3380-7382-11eb-93f3-f91d4bfd5a53.png)
##### https://www.erdcloud.com/d/yNZTy79XEqxKJz6k4

# 로그인
![캡처](https://user-images.githubusercontent.com/58330668/108584470-20056080-7385-11eb-88e4-d3e1a6ee2da4.PNG)

1. Spring security와 소셜 로그인API를 이용하여 로그인을 구현 함
2. 소셜 로그인 시 회원가입이 필요한 경우 추가 기입없이 바로 회원가입 후 로그인 진행
3. Spring security의 기능 중 하나인 remember me 를 이용하여, 체크박스를 체크하면 화면을 껐다가 다시 접속해도 계속 로그인상태를 유지하도록 설정
4. 로그인 실패 시 화면에 에러 메세지를 출력함

# 로드맵 작성_1
![캡처](https://user-images.githubusercontent.com/58330668/108584542-9013e680-7385-11eb-9f73-7c5185447048.png)

1. 로드맵 페이지: 사이트에 올라온 강의들의 커리큘럼을 구성할 수 있다. 강의는 TUTOR레벨만 등록할 수 있지만 로드맵은 USER레벨 회원도 작성할 수 있다
2. 로드맵 작성1페이지와 로드맵 작성2페이지로 구성
   - 로드맵 작성 1페이지: 해당 로드맵에 대한 설명작성 (summernote사용)  
   - 로드맵 작성 2페이지: 해당 로드맵에 들어가는 강의리스트를 입력
3. 강의는 4개이상으로 구성해야 등록을 완료할 수 있고, 강의 목록이 1개 이하가 되면 삭제할 수 없다
4. 글 작성을 완료하지않고 다른 페이지로 이동하면 “페이지를 벗어나면 작성된 내용은 저장되지않습니다” 경고창을 띄운다
5. 강의 순서를 변경하고 싶다면 화살표를 이용하여 이동할 수 있고 삭제도 가능하다

# 로드맵 작성_2
![캡처](https://user-images.githubusercontent.com/58330668/108584639-61e2d680-7386-11eb-8a98-83f9b5cf2e61.png)

5. 팝업창에서는 카테고리 별 강의 목록을 확인할 수 있고, 원하는 강의를 선택하면 강의 등록하기 페이지의 해당 영역에 강의 제목이 출력된다
6. 강의 대분류는 Slim Select(multiselect plugin)를 활용하였다

# 로드맵 수정&삭제
![roadmap3](https://user-images.githubusercontent.com/58330668/108584669-9c4c7380-7386-11eb-9b40-72ffbf69858a.png)

1. 로드맵 수정 및 삭제는 마이페이지/로드맵 페이지에서 가능하다

# 로드맵 디테일_1
![roadmap_detail1](https://user-images.githubusercontent.com/58330668/108584699-d3bb2000-7386-11eb-842f-b26b2a4c2be3.png)

1. 로드맵 디테일은 제목, 본문, 강의 목록, 댓글, 사이드바 로 구성되어 있다
2. 제목: 로드맵의 제목, 구독자 수, 등록된 강의 개수를 확인할 수 있다

![roadmap_detail2](https://user-images.githubusercontent.com/58330668/108584714-e46b9600-7386-11eb-8da2-1f9a48d0a8eb.png)

3. 댓글: ajax를 이용하여 입력/수정/삭제/답글 달기 기능을 만들었고 답글 달기는 모달창을 이용하여 내용을 입력 받았다. 
   수정 삭제 버튼은 본인 댓글일 경우에만 보여지고 로그인을 하지 않았을 경우 보기 기능만 이용할 수 있다

# 로드맵 디테일_2
![roadmap_detail3](https://user-images.githubusercontent.com/58330668/108584778-50e69500-7387-11eb-98c6-3b36ffa878f7.png)

4. 사이드바는 로드맵 참여, 주소복사, 카카오톡 공유 로 구성되어 있다
5. 로그인을 하지않고 참여하기 버튼을 누를 경우 로그인 페이지로 이동하고, 로그인 성공 후 다시 원래 페이지로 redirect된다

![roadmap_detail4](https://user-images.githubusercontent.com/58330668/108584786-652a9200-7387-11eb-9d15-e47be4438fdc.png)

6. 주소 복사하기 버튼을 눌러 현재 URL이 클립보드에 복사되면 “주소가 복사되었습니다” 확인창이 뜬다
7. 카카오톡 공유하기는 카카오 링크 API를 이용하였다. 공유하기 완료 후 대화창에서 웹으로 보기를 누르면 해당 페이지로 이동할 수 있다

# 로드맵 디테일_3
![roadmap_detail5](https://user-images.githubusercontent.com/58330668/108584810-85f2e780-7387-11eb-8b57-7acfcdffcd33.png)

8. 로드맵 구독하기를 누르면 로드맵에 포함된 강의 중 유료강의를 한번에 장바구니에 넣을 수 있다
9. 이 때 현재 수강 중 이거나 이미 장바구니에 포함되어 있는 강의는 사이드바에 출력되지 않는다
10. 구독취소하기 버튼을 눌러도 장바구니에서는 삭제되지않는다

![roadmap_detail6](https://user-images.githubusercontent.com/58330668/108584820-9c00a800-7387-11eb-8df2-2166de0ec474.png)
11. 강의 중 일부만 장바구니에 담았을 경우 담기지 않은 강의들은 그대로 표시된다


