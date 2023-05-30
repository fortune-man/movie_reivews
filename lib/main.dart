import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage() // 홈페이지 데이터
        );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 영화 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      }
    ];

    // 렌더링
    return Scaffold(
      appBar: AppBar(
          elevation: 0.25,
          centerTitle: false,
          title: Text(
            "Moview Reviews",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                icon: Icon(Icons.person_outline, color: Colors.black),
                onPressed: () {
                  print('사용자 프로필 조회');
                }),
          ]),
      body: Column(children: [
        Padding(padding: EdgeInsets.all(15)),
        TextField(
            decoration: InputDecoration(
                hintText: '영화 제목을 검색해주세요',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black)),
                suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      print('검색 결과 조회');
                    }))),
        Divider(height: 1),
        Expanded(
            child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  String category = dataList[index]['category'];
                  String imgUrl = dataList[index]['imgUrl'];

                  return Card(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          imgUrl,
                          width: 350,
                          height: 500,
                          fit: BoxFit.cover,
                        ),
                        Container(
                            width: 350,
                            height: 500,
                            color: Colors.grey.withOpacity(0.3)),
                        Text(category,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontStyle: FontStyle.normal,
                                height: 2.0))
                      ],
                    ),
                  );
                }))
      ]),
    );
  }
}
