import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _CategoriesReference =
      FirebaseFirestore.instance.collection("Categories");
  /////////////////////////
  final CollectionReference _ProductsReference =
      FirebaseFirestore.instance.collection("Products");
  Future<List<QueryDocumentSnapshot>> getCategories() async {
    var value = await _CategoriesReference.get();
    return value.docs;
  }
///////////////////////

  Future<List<QueryDocumentSnapshot>> getProducts() async {
    var value = await _ProductsReference.get();
    return value.docs;
  }
}
