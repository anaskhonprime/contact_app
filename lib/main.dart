import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()
  ));
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

  inc(){
    setState(() {
      a++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context, builder: (context){
               return Dialog(
                child: DialogUI(
                  a : a,
                  names : names,
                  inc: inc
                )
               );
            });
          },
        ),
        appBar: AppBar(title: Text(a.toString())),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i) {
            return ListTile(
              title: Text(names[i]),
              leading: Icon(Icons.account_box),
            );
          },
          ),
        bottomNavigationBar: BottomUI()
      );
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({super.key, this.a, this.names, this.inc});
  final a;
  final names;
  final inc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, 
      padding: EdgeInsets.all(20),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(a.toString(), style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700
          )),
          TextField(
            decoration: InputDecoration(
              labelText: "010-1234-1234",
              border: UnderlineInputBorder(),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){}, 
                child: Text("Cancel")),
                TextButton(onPressed: (){
                  inc();
                }, 
                child: Text("Okay")),
              ],
            ),
          )
        
        ],
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

