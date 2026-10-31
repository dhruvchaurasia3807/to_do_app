import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user => _auth.authStateChanges();

  //LIGIN
  Future<User?> signIn(String email, String password) async{
    try{
       UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
         password: password,
         );
         return result.user;
    }
    catch(e){
      rethrow;
    }
  }

  //SIGNUP
  Future<User?> signUp(String email,String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
         password: password,
         );
         return result.user;
    }
    catch{
      rethrow;
    }
  }

  //LOGOUT / SIGNOUT
Future<void> signOut() async{
  await _auth.signOut();
}
}