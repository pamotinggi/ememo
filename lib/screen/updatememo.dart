import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ememo/model/memo_model.dart';

class UpdateMemp extends StatefulWidget {
  const UpdateMemp({Key? key}) : super(key: key);

  @override
  State<UpdateMemp> createState() => _UpdateMempState();
}

class _UpdateMempState extends State<UpdateMemp> {
  final fromNameController = TextEditingController();
  final toNameController = TextEditingController();
  final memoController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Memo"),
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
                  final snackBar =
                      SnackBar(content: const Text("Memo Submitted"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  final docUser = FirebaseFirestore.instance
                      .collection('memo')
                      .doc(user!.email);
                  docUser.update({
                    'from': fromNameController.text,
                    'to': toNameController.text,
                    'memo': memoController.text,
                  });
                },
                child: const Text('Edit Memo'),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
