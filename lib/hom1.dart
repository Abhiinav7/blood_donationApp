import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  Future getData()async{
    try{
      // var data;
      // CollectionReference donor = FirebaseFirestore.instance.collection("donor");
      // QuerySnapshot qry= await donor.get();
      // data=qry.docs.map((e) => e.data()).toList();
      //
      // return data;
      var data;
      CollectionReference donor = FirebaseFirestore.instance.collection("donor");
      QuerySnapshot qry = await donor.get();
      data = qry.docs.map((e) {
        var documentData = e.data() as Map<String, dynamic>;
        documentData['id'] = e.id; // Add the document ID to the data
        return documentData;
      }).toList();

    }
    catch(e){
      print("error=====${e}");
    }
  }

  void deleteDonor(docId){
    try{
        CollectionReference donor = FirebaseFirestore.instance.collection("donor");
        donor.doc(docId).delete();
    }
        catch(e){
        print("error/////////////////////////${e}");}


  }

@override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blood Donation"),
        titleTextStyle: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.pink,
        leading: Icon(
          Icons.accessibility,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: getData(),
          builder: (context,  snapshot) {
            if (snapshot.hasData) {
              var d=snapshot.data as List;
              return ListView.builder(
                itemCount: d.length,
                itemBuilder: (context, index) {
                  var d1=d[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.5),blurRadius: 10,spreadRadius: 15)
                          ]
                      ),
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: CircleAvatar(
                                backgroundColor: Colors.brown,
                                radius: 32,
                                child: Text(
                                  d1["group"],
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                d1["name"],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Text(
                                d1["phone"].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15,color: Colors.redAccent),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/update",
                                  arguments: {
                                    "name":d1["name"],
                                    "phone":d1["phone"].toString(),
                                    "group":d1["group"],
                                    "id":d1.id

                                  });

                                },
                                icon: Icon(Icons.edit),
                                iconSize: 30,
                                color: Colors.blue,
                              ),
                              IconButton(
                                onPressed: () {
                                   deleteDonor(d1.id);


                                },
                                icon: Icon(Icons.delete),
                                iconSize: 30,
                                color: Colors.red,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
