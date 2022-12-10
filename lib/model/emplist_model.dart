import 'package:servic3/model/emp_model.dart';

class EmpList {

  late String status;
  late String massage;
  late List<Employee> data;

  EmpList.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        massage = json['massage'],
        data = List<Employee>.from(json['data'].map((x) => Employee.fromJson(x)));

  Map<String, dynamic> toJson() => {
    'status': status,
    'massage': massage,
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
  };

  }