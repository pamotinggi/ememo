import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ememo/model/memo_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final fromNameController = TextEditingController();
  final toNameController = TextEditingController();
  final memoController = TextEditingController();
  //firebase thing
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  memo memomodel = new memo();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.memomodel = memo.fromMap(value.data());
      setState(() {});
    });
  }

  //actual flutter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit Memo"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(9),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: fromNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'From',
                    hintText: 'From :'),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: toNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'To',
                    hintText: 'To :'),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: memoController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Memo',
                    hintText: 'Memo :'),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  var date = DateTime.now().toString();
                  Map<String, dynamic> data = {
                    "from": fromNameController.text,
                    "to": toNameController.text,
                    "memo": memoController.text,
                  };
                  FirebaseFirestore.instance
                      .collection('memo')
                      .doc(user!.email)
                      .collection('content')
                      .doc(date)
                      .set(data);
                  final snackBar =
                      SnackBar(content: const Text("Memo Submitted"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Submit Memo'),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
