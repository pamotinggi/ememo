class memo{
  String? from;
  String? to;
  String? content;
  String? status;

  memo({this.content, this.from, this.to, this.status});

  factory memo.fromMap(map){
    return memo(
      from: map['from'],
      to: map['to'],
      content: map['content'],
      status: map['status'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'from':from,
      'to':to,
      'content':content,
      'status':status,
    };
  }
}