import 'dart:async';
import 'dart:convert';

import 'package:employee_app/model/employee_model.dart';
import 'package:employee_app/views/home_screen/employee_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  final isScrollToTop = false.obs;
  final List<EmployeeModel> employees = [];
  List<EmployeeModel> allEmployees = [];

  List<String> alphabetList = [];

  var isScrollToAlphabet = false.obs;
  int _currentPage = 1;
  int totalEmployees = 0;

  ScrollController scrollController = ScrollController();

  var isLoading = false.obs;

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    loadEmployeeList().then((value) {
      Get.offAll(() => const EmployeeListPage());
    });

    super.onInit();
  }

  void _scrollListener() {
    isScrollToTop.value = scrollController.offset > 100;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _fetchEmployees();
    }
  }

  Future<void> _fetchEmployees() async {
    if (!isLoading.value && employees.length < totalEmployees) {
      isLoading.value = true;

      List<EmployeeModel> fetchedEmployees =
          generateEmployees(allEmployees, _currentPage);

      employees.addAll(fetchedEmployees);

      alphabetList = generateAlphabetList(allEmployees);

      _currentPage++;
      isLoading.value = false;
    }
  }

  List<EmployeeModel> generateEmployees(
      List<EmployeeModel> employeesList, int page) {
    List<EmployeeModel> generatedListEmp = [];
    int startIndex = (page - 1) * 50;
    int endIndex = startIndex + 50;
    endIndex =
        endIndex > employeesList.length ? employeesList.length : endIndex;

    for (int i = startIndex; i < endIndex; i++) {
      EmployeeModel emp = employeesList[i];
      generatedListEmp.add((emp));
    }
    return generatedListEmp;
  }

  List<String> generateAlphabetList(List<EmployeeModel> employees) {
    List<String> alphabetList = [];
    for (EmployeeModel employee in employees) {
      String firstLetter = employee.firstName[0].toUpperCase();
      if (!alphabetList.contains(firstLetter)) {
        alphabetList.add(firstLetter);
      }
    }
    alphabetList.sort();
    return alphabetList;
  }

  void scrollToAlphabet(String alphabet) {
    isScrollToAlphabet.value = true;
    final index = allEmployees.indexWhere(
        (employee) => employee.firstName[0].toUpperCase() == alphabet);

    if (index != -1) {
      scrollController.animateTo(
        index * 56.0, // Adjust the value based on your list item's height
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  Future loadEmployeeList() async {
    String jsonData = await rootBundle.loadString('assets/employees.json');
    List employeesJson = json.decode(jsonData);

    List<EmployeeModel> employees = [];
    for (var v in employeesJson) {
      employees.add(EmployeeModel.fromJson(v));
    }

    employees.sort((a, b) {
      return a.firstName
          .substring(0, 2)
          .toLowerCase()
          .compareTo(b.firstName.substring(0, 2).toLowerCase());
    });
    allEmployees = employees;
    totalEmployees = allEmployees.length;

    _fetchEmployees();
  }
}
