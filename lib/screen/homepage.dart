import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ememo/model/user_model.dart';
import 'package:ememo/model/viewmemo.dart';
import 'package:ememo/screen/inserdata.dart';
import 'package:ememo/widget/memo_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'loginscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel _userModel = UserModel();
  List<Object> _itemList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this._userModel = UserModel.fromMap(value.data());
      setState(() {});
    });
    getMemoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home Screen"),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _itemList.length,
              itemBuilder: (context, index) {
                final item = _itemList[index];
                return MemoCard(_itemList[index] as viewmemo);
              }),
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.menu,
          backgroundColor: Colors.blueAccent,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.add),
                label: 'Add New Memo',
                backgroundColor: Colors.blueAccent,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InsertData()));
                }),
            SpeedDialChild(
                child: const Icon(Icons.refresh),
                label: 'Refresh home page',
                backgroundColor: Colors.blueAccent,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
            SpeedDialChild(
                child: const Icon(Icons.logout_outlined),
                label: 'Sign out',
                backgroundColor: Colors.blueAccent,
                onTap: () {
                  _signOut;
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
          ],
        ));
  }

  Future getMemoList() async {
    var data = await FirebaseFirestore.instance
        .collection('memo')
        .doc(user!.email)
        .collection('content')
        .get();
    setState(() {
      _itemList = List.from(data.docs.map((doc) => viewmemo.fromSnapshot(doc)));
    });
  }
}

Future<void> _signOut() async {
  await FirebaseAuth.instance.signOut();
}