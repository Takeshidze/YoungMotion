enum Gender {
  male,
  female,
}

class Person {
  String name;
  String surname;
  String email;
  String phone;
  Gender gender;
  Person(
      {this.name = '',
      this.surname = '',
      this.email = '',
      this.phone = '',
      this.gender = Gender.male});
}
