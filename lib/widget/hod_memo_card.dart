import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ememo/model/viewmemo.dart';
import 'package:ememo/screen/hodupdate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/memo_model.dart';

class HodCard extends StatelessWidget {
  final viewmemo cards;
  HodCard(this.cards);

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
                  Text("From :" + '${cards.from}'),
                  Text("To :" + '${cards.to}'),
                  Text("Memo :" + '${cards.memo}'),
                  Text("Hod Approval :" + '${cards.status}'),
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
                      MaterialPageRoute(builder: (context) => HodUpdate(cards : cards)));
                },
                child: Text("Edit"),
              ),
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  final snackBar =
                  SnackBar(content: const Text("Memo Deleted, please refresh"));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  final docUser = FirebaseFirestore.instance
                      .collection('memo')
                      .doc('hod@memo.com')
                      .collection('content')
                      .doc(cards.id);
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
