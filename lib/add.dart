import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddDonor extends StatefulWidget {
  const AddDonor({super.key});

  @override
  State<AddDonor> createState() => _AddDonorState();
}

class _AddDonorState extends State<AddDonor> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection("donor");

  void addDOnor() {
    try{
      final data = {
        "name": donorName.text,
        "phone": donorPhone.text,
        "group": selectedGroups
      };
      donor.add(data);
    }
   catch(e){
      print(e);
   }

  }

  TextEditingController donorName = TextEditingController();
  TextEditingController donorPhone = TextEditingController();

  String? selectedGroups;
  final List bld = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              size: 29,
              color: Colors.white,
            )),
        title: Text("Add Users"),
        titleTextStyle: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.pink,
        //leading: Icon(Icons.accessibility,color: Colors.white,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          children: [
            SizedBox(
              height: 29,
            ),
            TextField(
              controller: donorName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Donor Name"),
                  hintText: "Name"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: donorPhone,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  prefixText: "+91",
                  border: OutlineInputBorder(),
                  label: Text("Donor Number"),
                  hintText: "PhoneNumber"),
            ),
            DropdownButtonFormField(
                decoration: InputDecoration(label: Text("Select Blood group")),
                items: bld
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (e) {
                  selectedGroups = e as String?;
                }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  addDOnor();
                  Navigator.pop(context);
                  // setState(() {
                  //
                  // });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.pink),
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, 45))),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
