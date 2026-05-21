class Accountmodel {
  final String buy;
  final int rupes;
  final int? id;

  Accountmodel({this.id, required this.buy, required this.rupes});

  factory Accountmodel.fromJson(Map<String, dynamic> json) {
    return Accountmodel(
      buy: json['buy'],
      rupes: json['rupes'],
      id: json['id'],
    );
  }

  Map<String, dynamic> tomap() {
    return {
      if (id != null) 'id': id,
      'buy': buy,
      'rupes': rupes, // Fixed typo: matched to 'rupes' column
    };
  }
}
