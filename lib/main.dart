import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  var a = 1;
  var names = ['Kim', 'Park', 'Pizza'];
  var like = [0,0,0];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              a++;
            });
            print(a);
          },
          child: Text(a.toString()),
          ),
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i) {
            return ListTile(
              title: Text(names[i]),
              leading: Text(like[i].toString()),
              trailing: TextButton(onPressed: (){
                return setState(() {
                  like[i]++;
                });
              }, child: Text("Like")),
            );
          },
          ),
        bottomNavigationBar: BottomUI()
      ),
    );
  }
}


class ShopItem extends StatelessWidget {
  const ShopItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        );
  }
}


class BottomUI extends StatelessWidget {
  const BottomUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page),
            ],
          ),
        );
  }
}

