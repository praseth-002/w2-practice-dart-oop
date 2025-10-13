enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  String zipCode;

  Address(this.street, this.city, this.zipCode);

  @override
  String toString() => "$street, $city, $zipCode";
}

class Employee {
  final String _name;
  double _baseSalary;

  Set<Skill> _skills = {};
  final Address _address;
  int _yearsOfExp;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExp);

  Employee.mobileDev(String name, double baseSalary, Address address, int yearsOfExp) :
    this._name = name, this._baseSalary = baseSalary, this._skills = {Skill.DART, Skill.FLUTTER}, this._address = address, this._yearsOfExp = yearsOfExp; 
  
  Employee.otherDev(String name, double baseSalary, Address address, int yearsOfExp) :
    this._name = name, this._baseSalary = baseSalary, this._skills = {Skill.OTHER}, this._address = address, this._yearsOfExp = yearsOfExp;

  String get name => _name;
  double get baseSalary => _baseSalary;
  Set<Skill> get skills => _skills;
  String get address => _address.toString();
  int get yearsOfExp => _yearsOfExp;


  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}, Skills: $skills, Address: $address, Years of experience: $yearsOfExp');
  }

  double totalSalary() {
    double total = 0;
    for (var skill in skills) {
      if(skill == Skill.FLUTTER){total += 5000;}
      if(skill == Skill.DART) {total += 3000;}
      if(skill == Skill.OTHER) {total += 1000;}
    }
    return baseSalary + total + (yearsOfExp * 1000);
  }
}

void main() {
  Address add1 = Address("45", "PNH", "12345");
  var emp1 = Employee('Sokea', 40000,{Skill.DART}, add1, 2);
  emp1.printDetails();
  print("total salary: \$${emp1.totalSalary()}");

  var emp2 = Employee.mobileDev('name', 5, add1, 1);
  emp2.printDetails();
}