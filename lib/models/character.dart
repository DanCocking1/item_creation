class Character {

  String name;
  DateTime created = new DateTime.now();
  String surname;
  int primaryColor;
  int secondaryColor;
  int level = 1;
  int age;
  String race;
  String gender;
  String fanausType;
  String citizenShip;
  String occupation;
  String background;

  Character(this.name, this.surname, this.primaryColor, this.secondaryColor,
      this.age, this.race, this.gender, this.fanausType, this.citizenShip,
      this.background);
}
