import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseDatabase {
  // Firebase Auth and Firestore instances,
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  // Required data to add in the document.
  final String uuid;
  final String emailId;

  //Constructor for getting the UUID.
  FirebaseDatabase({this.uuid, this.emailId});

  Future<void> initialSaveUserToCollection() async {
    // Handling Exceptions if any.
    try {
      // Getting the document from Firestore.
      final CollectionReference collectionReference =
          _firestore.collection('users');
      DocumentSnapshot document =
          await collectionReference.document(this.uuid).get();
      Map<String, dynamic> map = document.data;

      // Checking if data is already present. If not, create a document.
      if (map == null) {
        await collectionReference.document(this.uuid).setData({
          'uuid': this.uuid,
          'emailId': this.emailId,
        });
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
