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
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 200,
          decoration: BoxDecoration(
            border: BoxBorder.all(color: const Color.fromARGB(221, 91, 83, 83)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Container(child: Image.asset('assets/image1.jpg')),
              Container(
                width: 150,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("text 1", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700)),
                    Text("text 2"),
                    Text("text 3"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Like"),
                        Icon(Icons.notifications_off_sharp)
                      ],
                    )
                  ],
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
