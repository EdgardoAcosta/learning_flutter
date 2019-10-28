import 'dart:async';
import 'dart:math';
import 'package:block_employee/employee.dart';

class EmployeeBloc {
  List<Employee> _employeeList = [
    Employee(1, 'Name 1', 1000.0),
    Employee(2, 'Name 2', 2000.0),
    Employee(3, 'Name 3', 3000.0),
    Employee(4, 'Name 4', 4000.0),
  ];

// STREAM CONTROLLERS

  final _employeeListStreamController = StreamController<List<Employee>>();

  final _employeeSlaryIncrementStreamController = StreamController<Employee>();

  final _employeeSlaryDecrementStreamController = StreamController<Employee>();

  // getters

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;

  //setter

  StreamSink<List<Employee>> get employeeSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSlaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSlaryDecrementStreamController.sink;

  EmployeeBloc() {
    // Set initial data
    _employeeListStreamController.add(_employeeList);

    _employeeSlaryIncrementStreamController.stream.listen(_incrimentSalary);

    _employeeSlaryDecrementStreamController.stream.listen(_decrimentSalary);
  }

  _incrimentSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20 / 100;

    _employeeList[employee.id - 1].salary = (salary + incrementedSalary).round().toDouble();

    employeeSink.add(_employeeList);
  }

  _decrimentSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalary = salary * 20 / 100;

    _employeeList[employee.id - 1].salary = (salary - decrementedSalary).round().toDouble();

    employeeSink.add(_employeeList);
  }

  void dispose() {
    _employeeListStreamController.close();
    _employeeSlaryIncrementStreamController.close();
    _employeeSlaryDecrementStreamController.close();
  }
}
