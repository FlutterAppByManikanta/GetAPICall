import 'package:flutter/material.dart';

import '../network/HTTPServiceCall.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  HTTPServiceCall httpServiceCall = HTTPServiceCall();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("POST DATA"),
        backgroundColor: Colors.pinkAccent),
      backgroundColor: Colors.white,
      body: FutureBuilder(future: httpServiceCall.getPostDataInformation(),
      builder: (BuildContext context,AsyncSnapshot snapshot) {

        if (snapshot.data != null) {

          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(snapshot.data[index].userId.toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.bold),),

                        const SizedBox(height: 8,),

                        Text(snapshot.data[index].id.toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 13,fontWeight: FontWeight.normal),),

                        const SizedBox(height: 8,),

                        Text(snapshot.data[index].title.toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 13,fontWeight: FontWeight.normal),),

                        const SizedBox(height: 8,),

                        Text(snapshot.data[index].body.toString(),style: TextStyle(color: Colors.blueAccent,fontSize: 13,fontWeight: FontWeight.normal),),

                        const SizedBox(height: 8,),

                      ],
                    ),
                  ),
                );
              });

        } else {
          return Center(child: Text("No Data Found"));
        }
      },
      ),
    );
  }
}
