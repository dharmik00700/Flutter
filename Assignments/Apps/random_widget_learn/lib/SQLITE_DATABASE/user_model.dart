
class UserModel {
  final String name;
  final int age;
  final int id;

  UserModel({required this.name, required this.age, required this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], age: json['age'], id: json['id']);
  }

  Map<String, dynamic> tomap() {
    return {'name': name, 'age': age, 'id': id};
  }
}
