import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ememo/screen/updatememo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ememo/model/viewmemo.dart';

import '../model/memo_model.dart';

class MemoCard extends StatelessWidget {
  final viewmemo card;
  MemoCard(this.card);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    memo memomodel = new memo();

    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30),
            ),
            width: 400,
            child: Card(
              color: Colors.blue,
              elevation: 1,
              child: Column(
                children: <Widget>[
                  Text("From :" + '${card.from}'),
                  Text("To :" + '${card.to}'),
                  Text("Memo :" + '${card.memo}'),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.yellowAccent,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateMemp()));
                },
                child: Text("Edit"),
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  final snackBar =
                  SnackBar(content: const Text("Memo Updated"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  final docUser = FirebaseFirestore.instance
                      .collection('memo')
                      .doc(user!.email)
                      .collection('content')
                      .doc();
                  docUser.delete();
                },
                child: Text("Delete"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
