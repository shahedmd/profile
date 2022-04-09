import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';

class UserPage extends StatefulWidget {
  const UserPage({ Key? key }) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
 
 List users=[];

 Future<void> getUser()async{
   
   final String response = await rootBundle.loadString("assets/api.json");

   final data = await json.decode(response);

   setState(() {
     users=data["users"];
   });


 }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

    appBar: AppBar(title: const Center(child: Text("Shahed.com Users"),),),

    body: Column(children: [
      ElevatedButton(onPressed: getUser, child: Text("Show Users")),
      SizedBox(height: 10,),
    
    
      users.isNotEmpty ?
                      Expanded(
                        child: ListView.builder(itemBuilder: (context, index){
                          return Container(margin: EdgeInsets.all(10),
                            child: ListTile(tileColor: Colors.blue,
                              leading: Container(child: Text(users[index]["index"])),
                              title: Text(users[index]["name"]),
                              subtitle: Text(users[index]["email"]),
                            ),
                          );
                        },
                                        itemCount: users.length,),
                      )
    :Container()
    ],),

    ); 
  }
}