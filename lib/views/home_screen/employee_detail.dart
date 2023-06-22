import 'package:employee_app/model/employee_model.dart';
import 'package:employee_app/widgets/card_widget_emp.dart';
import 'package:flutter/material.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({super.key, required this.employee});
  final EmployeeModel employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      employee.imageUrl!,
                    ),
                    radius: 60,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${employee.firstName} ${employee.lastName!}",
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    employee.email!,
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color.fromARGB(31, 201, 201, 201),
                  ),
                  const SizedBox(height: 5),
                  CardWidgetEmployee(
                    data: employee.contactNumber ?? "",
                    icon: Icons.phone,
                    title: "Mobile Number",
                  ),
                  const SizedBox(height: 10),
                  CardWidgetEmployee(
                    data: employee.age.toString(),
                    icon: Icons.person,
                    title: "Age",
                  ),
                  const SizedBox(height: 10),
                  CardWidgetEmployee(
                    data: employee.dob.toString(),
                    icon: Icons.date_range,
                    title: "Date of Birth",
                  ),
                  const SizedBox(height: 10),
                  CardWidgetEmployee(
                    data: "${employee.salary} LPA",
                    icon: Icons.attach_money,
                    title: "Salary",
                  ),
                  const SizedBox(height: 10),
                  CardWidgetEmployee(
                    data: employee.address ?? "",
                    icon: Icons.home,
                    title: "Address",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
