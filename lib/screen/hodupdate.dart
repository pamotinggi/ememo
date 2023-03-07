import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/memo_model.dart';
import '../model/viewmemo.dart';

class HodUpdate extends StatefulWidget {
  final viewmemo cards;
  const HodUpdate({Key? key, required this.cards}) : super(key: key);

  @override
  State<HodUpdate> createState() => _HodUpdateState();
}

class _HodUpdateState extends State<HodUpdate> {
  late String id;
  final fromNameController = TextEditingController();
  final toNameController = TextEditingController();
  final memoController = TextEditingController();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  memo memomodel = new memo();

  @override
  void initState() {
    id = widget.cards.id!;
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
                  SnackBar(content: const Text("Memo Updated, please refresh"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  final docUser = FirebaseFirestore.instance
                      .collection('memo')
                      .doc(user!.email)
                      .collection('content')
                      .doc(id);
                  docUser.update({
                    'from': fromNameController.text,
                    'to': toNameController.text,
                    'memo': memoController.text,
                    'status': "Approved",
                  });
                },
                child: const Text('Approve Memo'),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
