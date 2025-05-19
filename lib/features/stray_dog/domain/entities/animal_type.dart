class AnimalType {
  int id;
  String name;

  AnimalType({
    required this.id,
    required this.name,
  });

  static List<AnimalType> get animalsDummyData => [
        AnimalType(
          id: 1,
          name: "Gato",
        ),
        AnimalType(
          id: 2,
          name: "Perro",
        ),
      ];
}
