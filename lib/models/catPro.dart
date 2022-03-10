
class CattlePro {
  final int? id;
  final String name;
  final String? gender;
  final String species;

  CattlePro(
      {this.id,
      required this.name,
      this.gender,
      required this.species});

  CattlePro.fromMap(Map<String,dynamic> res):
  id=res['id'],
  name=res['name'],
  gender=res['gender'],
  species=res['species'];

  Map<String, Object?> toMap() {
    return {
      'id': (id == 0) ? null : id,
      'name': name,
      'gender': gender,
      'species': species,
    };
  }
}
