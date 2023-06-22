import 'package:employee_app/controller/employee_controller.dart';
import 'package:employee_app/model/employee_model.dart';
import 'package:employee_app/views/home_screen/employee_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeListPage extends GetView<EmployeeController> {
  const EmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('Employee List'),
      ),
      floatingActionButton: Obx(
        () => Visibility(
          visible: controller.isScrollToTop.value,
          child: FloatingActionButton(
            elevation: 1,
            onPressed: () {
              controller.scrollController.animateTo(
                0.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              controller.isScrollToAlphabet.value = false;
            },
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Obx(
        () => Row(
          children: [
            Expanded(
              child: ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.isScrollToAlphabet.value
                    ? controller.allEmployees.length
                    : controller.employees.length +
                        (controller.isLoading.value ? 1 : 0),
                itemBuilder: (context, index) {
                  int len = controller.isScrollToAlphabet.value
                      ? controller.allEmployees.length
                      : controller.employees.length;
                  if (index < len) {
                    EmployeeModel employee = controller.isScrollToAlphabet.value
                        ? controller.allEmployees[index]
                        : controller.employees[index];
                    return ListTile(
                      onTap: () {
                        Get.to(() => EmployeeDetails(
                              employee: employee,
                            ));
                      },
                      title: Text(
                        "${employee.firstName} ${employee.lastName}",
                      ),
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(employee.imageUrl!),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: controller.alphabetList.map((alphabet) {
                  return InkWell(
                    onTap: () {
                      controller.scrollToAlphabet(alphabet);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        alphabet,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
