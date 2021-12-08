// ignore_for_file: file_names, prefer_if_null_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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

  Future<void> singOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  User getCurrentUser() {
    User user = _firebaseAuth.currentUser;

    return user;
  }

  String getCurrentUserName() {
    User user = _firebaseAuth.currentUser;
    return user.displayName != null ? user.displayName : "Unknown";
    
  }
  Future<void> updateDisplayName(String name)async{
   await _firebaseAuth.currentUser.updateDisplayName(name);
  }
  

  Future<void> createRequest(Map<String, dynamic> map) async {
    var allRequestsRef = _firebaseFirestore.collection("request");
    await allRequestsRef.doc(getCurrentUser().uid).set(map);
  }

  void createUser(Map<String, dynamic> map)async{
    var usersCollectionRef = _firebaseFirestore.collection("Users");
    await usersCollectionRef.doc(getCurrentUser().uid).set(map);
    
  }

 CollectionReference getRef(String refPath){
   var collectionRef=_firebaseFirestore.collection(refPath);
   return collectionRef;
 }

 Future<DocumentSnapshot>getDocument(String refPath)async{
   DocumentSnapshot snapshot;
  //await getRef(refPath).doc(getCurrentUser().uid).get().then((value) => snapshot=value);
  //return snapshot;
   snapshot=await getRef(refPath).doc(getCurrentUser().uid).get();
   return snapshot;
  

 }

  
  Stream<QuerySnapshot> getRequestListFromApi(String refPath) {
    return _firebaseFirestore.collection(refPath).snapshots();
  }
}
