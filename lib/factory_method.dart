enum EmployeeType {
  programmer,
  hrManager,
  boss,
}

abstract class Employee {
  void work();
  //factory method design pattern
  factory Employee(EmployeeType type) {
    switch (type) {
      case EmployeeType.programmer:
        return Programmer();
      case EmployeeType.hrManager:
        return HrManager();
      case EmployeeType.boss:
        return Boss();
      default:
        return Programmer();
    }
  }
}

class Programmer implements Employee {
  @override
  void work() {
    print('write code');
  }
}

class HrManager implements Employee {
  @override
  void work() {
    print('hire people');
  }
}

class Boss implements Employee {
  @override
  void work() {
    print('give orders');
  }
}
