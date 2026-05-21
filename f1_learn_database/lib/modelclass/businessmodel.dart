class Businessmodel {
  final String businessname;
  final String businessdetail;
  final int? id;
  final String businessmanname;

  Businessmodel({
    required this.businessname,
    required this.businessdetail,
    required this.id,
    required this.businessmanname,
  });

  Map<String, dynamic> tomap() {
    return {
      'id': id,
      'businessmanname': businessmanname,
      'businessname': businessname,
      'businessdetail': businessdetail,
    };
  }

  factory Businessmodel.frommap(Map<String, dynamic> map) {
    return Businessmodel(
      businessname: map['businessname'],
      businessdetail: map['businessdetail'],
      id: map['id'],
      businessmanname: map['businessmanname'],
    );
  }
}
