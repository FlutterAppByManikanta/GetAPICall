import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../network/HTTPServiceCall.dart';

class MyImageScreen extends StatefulWidget {
  const MyImageScreen({super.key});

  @override
  State<MyImageScreen> createState() => _MyImageScreenState();
}

class _MyImageScreenState extends State<MyImageScreen> {

  HTTPServiceCall httpServiceCall = HTTPServiceCall();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("POST DATA"),
          backgroundColor: Colors.pinkAccent),
      backgroundColor: Colors.white,
      body: FutureBuilder(future: httpServiceCall.getImageDataInformation(),
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

                          Container(
                              height: 120,
                              width: double.infinity,
                              child: Image.network(snapshot.data[index].url.toString(),fit: BoxFit.cover,))

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
