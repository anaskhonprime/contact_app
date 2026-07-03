import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Seoul", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          actions: [
            Container(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search, color: Colors.white),
                  Icon(Icons.menu, color: Colors.white),
                  Icon(Icons.notifications, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          height: 200,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 247, 246, 246),
            border:  Border.all(
              color: const Color.fromARGB(255, 151, 149, 149),
            ),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  child: Image.asset('assets/image1.jpg'),
                ),
              ),
              Flexible(
                flex : 5,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Text 1', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
                      Text('Text 2'),
                      Text('Text 3'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.star),
                          Text("Like")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page),
            ],
          ),
        ),
      ),
    );
  }
}
