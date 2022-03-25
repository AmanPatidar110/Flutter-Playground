// import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String _id;
  final String _name;
  final String _image;

  CategoryModel(this._id, this._name, this._image);

  //  getters
  String get id => _id;

  String get name => _name;

  String get image => _image;

//   CategoryModel.fromSnapshot(DocumentSnapshot snapshot){
//     _id = snapshot.data[ID];
//     _name = snapshot.data[NAME];
//     _image = snapshot.data[IMAGE];
//   }

}
