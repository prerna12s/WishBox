import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../modals/userModel.dart';

class authService {
     //create a private field
     final FirebaseFirestore _firestore;
     //create a private field
     final FirebaseAuth _firebaseAuth;

     authService({
          //take firestore instance as a parameter
          required FirebaseFirestore firestore,
          //take firebaseauth as a parameter
          required FirebaseAuth firebaseAuth
     })   //put value of instance in private field
         : _firestore=firestore,
              _firebaseAuth=firebaseAuth;

     //initialise usermodel
     late UserModel _userModel;

     CollectionReference get _users =>
         _firestore.collection("users");

}

