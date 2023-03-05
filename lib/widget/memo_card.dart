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
      child: Container(
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            Text(
              "From :" + '${card.from}'
            ),
            Text(
                "To :" + '${card.to}'
            ),
            Text(
                "Memo :" + '${card.memo}'
            ),
          ],
        ),
      ),
    );
  }
}
