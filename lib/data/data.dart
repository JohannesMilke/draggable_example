enum AnimalType { land, air }

class Animal {
  final String imageUrl;
  final AnimalType type;

  Animal({
    this.imageUrl,
    this.type,
  });
}

final allAnimals = [
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/animal1.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird1.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird2.png',
  ),
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/animal2.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird3.png',
  ),
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/animal3.png',
  ),
];
