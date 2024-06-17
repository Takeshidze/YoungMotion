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

  String getGenderAsString() {
    switch (gender) {
      case Gender.male:
        return 'Мужчина';
      case Gender.female:
        return 'Женщина';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'urname': surname,
      'email': email,
      'phone': phone,
      'gender': getGenderAsString(), // преобразуем enum в строку
    };
  }
}
