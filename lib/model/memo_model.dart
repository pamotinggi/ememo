class memo{
  String? from;
  String? to;
  String? content;

  memo({this.content, this.from, this.to});

  factory memo.fromMap(map){
    return memo(
      from: map['from'],
      to: map['to'],
      content: map['content'],
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'from':from,
      'to':to,
      'content':content,
    };
  }
}