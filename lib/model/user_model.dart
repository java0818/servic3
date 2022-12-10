class User{
  late int id;
  late String name;
  late String salary;
  late String age;

  User({required this.id, required this.name, required this.age, required this.salary});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        age = json['age'],
        salary = json['salary'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'age': age,
    'name': name,
    'salary': salary,
  };
}