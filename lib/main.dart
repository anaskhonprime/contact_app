import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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

  dynamic getPermission() async{
    var status = await Permission.contacts.status;
    if(status.isGranted){
      print("Granted");
    } else if(status.isDenied){
      print("Denied");
      Permission.contacts.request();
    }
  }

  @override
  void initState() {
    super.initState();
  }
  
  var a = 1;
  var names = ['Kim', 'Park', 'Pizza'];
  var like = [0,0,0];

  dynamic inc(){
    setState(() {
      a++;
    });
  }

  newContact(name){
   
    if(name.trim().isEmpty){
      return;
    }

    setState(() {
      names.add(name);
    });
  }

  deleteContact(name){
    setState(() {
      
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
                  newContact : newContact
                )
               );
            });
          },
        ),
        appBar: AppBar(title: Text("Contact"),
        actions: [
          IconButton(onPressed: (){
            getPermission();
          },
              icon: Icon(Icons.add))
        ],
        ),
        body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (c, i) {
            return ListTile(
              title: Text(names[i]),
              leading: Icon(Icons.account_box),
              trailing: IconButton(
                onPressed: (){
                  setState(() {
                    List<String> nName = [];
                    for(var j = 0; j < names.length; j++){
                      if(j != i){
                        nName.add(names[j]);
                      }
                    }
                    names = nName;
                  });
                }, 
                icon: Icon(Icons.delete)
              ),   
            );
          },
          ),
        bottomNavigationBar: BottomUI()
      );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({super.key, this.a, this.names, this.newContact});
  final a;
  final names;
  final newContact;

  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(a.toString(), style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700
          )),
          TextField(
            controller: inputData,
            decoration: InputDecoration(
              labelText: "name",
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
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, 
                child: Text("Cancel")),
                TextButton(onPressed: (){
                  newContact(inputData.text);
                  Navigator.of(context).pop();

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



