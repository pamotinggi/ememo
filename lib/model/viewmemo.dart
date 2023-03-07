class viewmemo {
  String? from;
  String? to;
  String? memo;
  String? status;

  viewmemo();

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'memo': memo,
        'status': status,
      };
  viewmemo.fromSnapshot(snapshot)
      : from = snapshot.data()['from'],
        to = snapshot.data()['to'],
        memo = snapshot.data()['memo'],
        status = snapshot.data()['status'];
}
