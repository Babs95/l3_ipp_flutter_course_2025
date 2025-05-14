class MyUserModel {
  String? _uuid;
  String? _email;
  String? _nom;
  String? _prenom;

  //Getters
  String? get uuid => _uuid;
  String? get email => _email;
  String? get nom => _nom;
  String? get prenom => _prenom;

  MyUserModel({
    required String uuid,
    required String email,
    required String nom,
    required String prenom,
}) {
    _uuid = uuid;
    _email = email;
    _nom = nom;
    _prenom = prenom;
  }
}