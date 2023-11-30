class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  Character.fromJson(Map<String, dynamic> json):

  id = json['id'],
  name = json['name'],
  status = json['status'],
  species = json['species'],
  gender = json['gender'],
  image = json['image'];

  Character.fromDatabaseMap(Map<String, dynamic> map):
  id = map['id'],
  name = map['name'],
  status = map['status'],
  species = map['species'],
  gender = map['gender'],
  image = map['image'];

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender,
      'image': image,
    };
  }
}