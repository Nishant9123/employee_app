import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/employee_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EmployeeController());
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              Spacer(),
              Text(
                "Employee App",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Spacer(),
              CircularProgressIndicator(
                color: Colors.black,
              ),
              Spacer(),
            ],
          ),
        )));
  }
}
