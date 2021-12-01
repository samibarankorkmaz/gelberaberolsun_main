import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore =FirebaseFirestore.instance;
  

  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  
  Future<void> singOut()async{
    await _firebaseAuth.signOut();    
  }  

  Stream<User> authStateChanges(){
    
    return _firebaseAuth.authStateChanges();
  }

  
  User getCurrentUser(){
    User user=_firebaseAuth.currentUser;
    
    return user;
  }
  String getCurrentUserName(){
    User user=_firebaseAuth.currentUser;
    return user.displayName!=null ? user.displayName : null;
    
  }

  Future<void> createRequest(Map<String,dynamic> map)async{
    var allRequestsRef =_firebaseFirestore.collection("request");
    await allRequestsRef.add(map);
  }

  Stream<QuerySnapshot> getRequestListFromApi(String refPath){
    return _firebaseFirestore.collection(refPath).snapshots();
  }

  

}
