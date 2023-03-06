import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ememo/screen/updatememo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ememo/model/viewmemo.dart';

import '../model/memo_model.dart';

class MemoCard extends StatelessWidget {
  late final viewmemo card;
  MemoCard(this.card);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    memo memomodel = new memo();

    return Container(
      color: Colors.blueAccent,
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: Column(
        children: [
          Container(
            width: 400,
            color: Colors.blue,
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
                      .doc(user!.uid);
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
