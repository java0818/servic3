

class Employee {

  int  id;
  String emp_name;
  String emp_salary;
  int emp_age;
  String emp_image;


  Employee.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        emp_name = json['emp_name'],
        emp_salary = json['emp_salary'],
        emp_age = json['emp_age'],
        emp_image = json['emp_image'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'emp_name': emp_name,
    'emp_salary': emp_salary,
    'emp_age': emp_age,
    'emp_image': emp_image,
  };
}