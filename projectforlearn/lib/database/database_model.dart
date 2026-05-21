class modeldatabase {
  final String name;
  final int? id;
  final int numbers;

  modeldatabase({required this.name, required this.numbers, required, this.id});

  factory modeldatabase.fromMap(Map<String, dynamic> map) {
    return modeldatabase(
      name: map['name'],
      numbers: map['number'],
      id: map['id'],
    );
  }

  Map<String, dynamic> tomap() {
    return {'name': name, 'number': numbers, 'id': id};
  }
}
