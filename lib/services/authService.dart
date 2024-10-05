import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:network_app/core/failure.dart';
import 'package:network_app/core/type_def.dart';

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
    required FirebaseAuth firebaseAuth,
  })  //put value of instance in private field
      : _firestore = firestore,
        _firebaseAuth = firebaseAuth;

  //initialise usermodel
  //zarurat padegii
  late UserModel _userModel;

  CollectionReference get _users => _firestore.collection("users");

  //auth state changes notifies about user sign in and sign out
  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  //create sign in method
  //takes paramater email and password
  FutureEither<UserModel?> signInWithEmailandPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return right(UserModel(uid: _firebaseAuth.currentUser!.uid));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  FutureEither<UserModel?> signUpWithEmailandPassword(
      String? email,
      String? firstname,
      String? lastname,
      String? password,
      String? address,
      String? phonenumber,
      String? image) async {
    try {
      _firebaseAuth.createUserWithEmailAndPassword(email: email!, password: password!).then((credential) async {
        if (credential.additionalUserInfo!.isNewUser) {
          _userModel = UserModel(
            uid: _firebaseAuth.currentUser!.uid,
            firstname: firstname,
            lastname: lastname,
          );

          await _users.doc(_firebaseAuth.currentUser!.uid).set(_userModel.toJson());
        } else {
          _userModel = await getUserDetails(credential.user!.uid).first;
        }
        return right(UserModel(uid: _firebaseAuth.currentUser!.uid, firstname: firstname, lastname: lastname));
      });
    }
    catch (e) {
      return left(Failure(message: e.toString()));
    }

  }

  Stream<UserModel>getUserDetails(uid){
     return
         _users.doc(uid).snapshots().map((event)=>UserModel.fromJson(event.data() as Map<String,dynamic>));

  }
}
