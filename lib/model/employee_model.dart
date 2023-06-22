import 'package:sticky_az_list/sticky_az_list.dart';

class EmployeeModel extends TaggedItem {
  int? id;
  String? imageUrl;
  late String firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  int? age;
  String? dob;
  double? salary;
  String? address;
  @override
  String sortName() => firstName;

  @override
  String toString() => firstName;
  EmployeeModel(
      {this.id,
      this.imageUrl,
      required this.firstName,
      this.lastName,
      this.email,
      this.contactNumber,
      this.age,
      this.dob,
      this.salary,
      this.address});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    contactNumber = json['contactNumber'];
    age = json['age'];
    dob = json['dob'];
    salary = json['salary'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['contactNumber'] = contactNumber;
    data['age'] = age;
    data['dob'] = dob;
    data['salary'] = salary;
    data['address'] = address;
    return data;
  }
}
