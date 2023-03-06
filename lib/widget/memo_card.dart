import 'package:ememo/screen/updatememo.dart';
import 'package:flutter/material.dart';
import 'package:ememo/model/viewmemo.dart';

class MemoCard extends StatelessWidget {
  late final viewmemo card;
  MemoCard(this.card);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      child: Column(
        children: [
          Card(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateMemp()));
                },
                child: Text("Edit"),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text("Delete"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
