// ignore_for_file: public_member_api_docs, sort_constructors_first

class Gender {
  int id;
  String name;
  Gender({
    required this.id,
    required this.name,
  });

  static List<Gender> get genderDummyData => [
        Gender(
          id: 1,
          name: "Masculino",
        ),
        Gender(
          id: 2,
          name: "Femenino",
        ),
      ];
}
