import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  void deleteDonor(docId){
    donor.doc(docId).delete();

  }
  CollectionReference donor = FirebaseFirestore.instance.collection("donor");

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
        child: StreamBuilder<QuerySnapshot>(
          stream: donor.orderBy("name").snapshots(),
          builder: (context,  snapshot) {
            if (snapshot.hasData) {
              final d=snapshot.data!.docs;
              return ListView.builder(
                itemCount: d.length,
                itemBuilder: (context, index) {
                 //final DocumentSnapshot donorSnp = snapshot.data.docs[index];
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
                                  d[index]["group"],
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
                                d[index]["name"],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Text(
                                d[index]["phone"].toString(),
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
                                    "name":d[index]["name"],
                                    "phone":d[index]["phone"].toString(),
                                    "group":d[index]["group"],
                                    "id":d[index].id
                                  }
                                  );

                                },
                                icon: Icon(Icons.edit),
                                iconSize: 30,
                                color: Colors.blue,
                              ),
                              IconButton(
                                onPressed: () {
                                   deleteDonor(d[index].id);

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
            else{
             return Center(
               child: CircularProgressIndicator(),
             );
            }
          },
        ),
      ),
    );
  }
}
