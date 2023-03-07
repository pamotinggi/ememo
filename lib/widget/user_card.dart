import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/memo_model.dart';
import '../model/viewmemo.dart';

class UserCard extends StatelessWidget {
  final viewmemo kad;
  UserCard(this.kad);

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
                  Text("From :" + '${kad.from}'),
                  Text("To :" + '${kad.to}'),
                  Text("Memo :" + '${kad.memo}'),
                  Text("Hod Approval :" + '${kad.status}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

