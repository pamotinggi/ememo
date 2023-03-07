class viewmemo {
  String? from;
  String? to;
  String? memo;
  String? status;
  String? id;

  viewmemo();

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'memo': memo,
        'status': status,
        'id': id,
      };
  viewmemo.fromSnapshot(snapshot)
      : from = snapshot.data()['from'],
        to = snapshot.data()['to'],
        memo = snapshot.data()['memo'],
        status = snapshot.data()['status'],
        id = snapshot.data()['id'];
}
