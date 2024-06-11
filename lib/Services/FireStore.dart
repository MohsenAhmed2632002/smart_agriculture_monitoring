import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_agriculture_monitoring/Model/UserModel.dart';
import 'package:get/get.dart';

class FireSoterUser extends GetxController {
  final CollectionReference collectionUser =
      FirebaseFirestore.instance.collection("Users");
  Future addUserToFireStore(UserModel userModel) async {
    return await collectionUser.doc(userModel.userId).set(
          userModel.toJson(),
        );
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await collectionUser.doc(uid).get();
  }
}
