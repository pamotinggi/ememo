class viewmemo {
  String? from;
  String? to;
  String? memo;

  viewmemo();

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'memo': memo,
      };
  viewmemo.fromSnapshot(snapshot)
      : from = snapshot.data()['from'],
        to = snapshot.data()['to'],
        memo = snapshot.data()['memo'];
}
