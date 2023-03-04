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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inser Data"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(9),
          child: Column(
            children: [
              SizedBox(height: 50,),
              TextField(
                controller: fromNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'From',
                  hintText: 'From :'
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: toNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'To',
                    hintText: 'To :'
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: memoController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Memo',
                    hintText: 'Memo :'
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(onPressed: (){
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
