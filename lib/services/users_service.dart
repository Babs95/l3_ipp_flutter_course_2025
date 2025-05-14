import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:l3_ipp_app/models/my_user_model.dart';
import 'package:logger/logger.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createUser(MyUserModel user) async {
    try{
      await _db.collection("users").doc(user.uuid).set({
        'email': user.email,
        'nom': user.nom,
        'prenom': user.prenom
      });

    }catch (ex) {
      Logger().e("Erreur lors de l'enregistrement sur FireStore: $ex");
    }
  }

  Future<MyUserModel?> fetchUserById(String? uuid) async {
    if(uuid == null) return null;

    final userDoc = await _db.collection("users").doc(uuid).get();

    if(userDoc.exists){
      return MyUserModel(
          uuid: uuid,
          email: userDoc.get('email'),
          nom: userDoc.get('nom'),
          prenom: userDoc.get('prenom'),
      );
    }

    return null;
  }
}