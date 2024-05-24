# ALE House
[산업구조변화대응 특화훈련] 공공데이터를 활용한 웹앱개발자 양성 과정 중 진행한 개인프로젝트 입니다.

## 👨‍🏫 프로젝트 소개
해외에서 와이너리체험을 했을때의 경험이 강하게 남아서 우리나라의 와이너리를 체험할 수 있는 정보와 각종 전통주, 와인, 수제맥주에 대해 알리고 싶었습니다.

## 프로젝트 사진
![main1](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/41d1c7aa-4b22-45a2-a566-b2db3e26f5d1)
![술상품전체](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/5d249732-49f5-4c4c-a081-f0c81122249d)
![와이너리전체](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/d1046e6b-733d-487f-b23a-9dd7d2955532)


## 🧑‍🤝‍🧑 개발자 소개
![내사진](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/e049b894-9042-4ac7-adee-7872ce3433ae)
- **정다운** : 전체

## ⚙️ 사용기술 및 개발환경
- **개발환경** : Windows10
- **개발도구** : MAVEN, Spring Tool Suit 4, SqlYog
- **개발언어 및 프레임워크** : HTTP, CSS, java(jdk1.7), javaScript, jQuery, Tailwind, daisyUI, SpringBoot
- **DB** : MySql
- **API** : KakaoMap API
- **CSV(공공데이터포털)** : 한국농수산식품유통공사_찾아가는양조장정보, 전라남도_대표명주(전통술) 현황


## 📝 프로젝트 아키텍쳐
![](https://velog.velcdn.com/images/jihyeon2434/post/429e7dcb-5e58-4ee3-8d79-8f56f5010f94/image.png)

## 프로젝트 PPT
[개인프로젝트ppt_정다운.pptx](https://github.com/JUNGmoon123/24.2.28_Project/files/15427740/ppt_.pptx)

## 📌 주요 기능
[벡앤드]
- 각종 술 정보 등록
CSV파일의 술데이터들을 DB에 저장해서 술 상품 페이지에 출력 합니다.

- 양조장(와이너리) 등록
CSV파일의 양조장 정보 및 위치 데이터들을 DB에 저장해서, 위치 데이터들은 KakaoMAP에 마커로 띄워주고,
정보데이터들은 블로그카드 형식으로 보여줍니다.

[프론트]
- 술상품 리스트
가격, 종류 별로 선택해서 볼 수 있습니다.

- 양조장(와이너리) 리스트
양조장(와이너리)의 정보 및 위치를 검색해서 볼 수 있습니다.

## 📘 가이드북
개인프로젝트 GitHub주소
https://github.com/JUNGmoon123/24.2.28_Project.git

1. **git클론 (참고자료: https://ittrue.tistory.com/91)**

![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/b59d89ec-8c19-460c-8eaa-8497b93fb934)

2. **CSV파일 확인, DB파일 확인(양조장, 술관련 테이블은 나중에 생성)**
   
![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/9bffc2be-ee0c-4dd1-a2b2-e6f8ccbf8f54)

3. **CSV데이터값 DB에 저장하기(brewery -> 양조장, beers -> 술)**
   
![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/99ccf69e-fb68-4bc4-ad7f-6daf1b186791)

DB의 나머지 테이블은 먼저 생성해도 되지만,  brewery/beers관련 테이블은 먼저 DB테이블을 생성한뒤,

![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/5d0b47a7-55d0-4e2a-b412-962a08cfde2b)

Controller에 CSVController의 적힌URL주소 readAndSvaeToDB로 저장해줍니다.(csv데이터가 정상 저장됐다고 나옵니다.)

![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/b01677a0-1ba4-42d4-be1e-00abacfc2fb2)

그 다음에 boardId와 memberId를 추가해야 합니다(한번에 넣으면 CSV데이터를 못 읽습니다.) 

4. **beers테이블도 똑같은 방법으로 합니다.**
   
![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/28fc3b61-51db-479a-8b64-1d9a3141e98c)

beers테이블 은 INSERT문까지 넣어주고 CSV데이터를 저장한 뒤에 ALTER문을 실행합니다.

**여기까지DB준비끝**
로컬 주소
![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/83431177-bebd-47e9-9fb0-0cafeb1bdcd7)


## 🎮기능설명
**메인**

![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/13e1b334-1f3b-4512-aa9c-99884b2516e7)

- 바로가기 버튼을 클릭하면 술 상품페이지로 이동합니다.

**술 상품 페이지**

![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/228e2b11-dcda-4980-b8b0-3c86b51582f2)
![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/cdd466c2-9f53-492f-9b3a-9e4d096fc6ce)

- 종류, 가격을 선택해서 볼 수 있습니다.

**술 상세페이지**

![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/c3fa0e93-6504-45a3-a5ea-5ce65fb5060d)

- 정보 및 구매링크 클릭시 연결된 링크로 이동합니다.

**양조장(와이너리) 페이지**

![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/7888673b-ac23-4e83-8099-231be79666ab)

- 각 양조장에대한 설명을 볼 수 있고, 검색도 가능합니다.
- 지도의 마커를 클릭해서 안보이게 할 수도 있습니다.

**양조장(와이너리) 상세페이지**

![image](https://github.com/JUNGmoon123/24.2.28_Project/assets/153145757/78fa11b4-dada-4f01-be53-c42ee9ef3e93)

- 주소 및 전화번호, 양조장에대한 설명을 볼 수 있습니다.
