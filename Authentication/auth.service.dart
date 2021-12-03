import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> get getUser => _auth?.currentUser();

  Stream<FirebaseUser> get user => _auth?.onAuthStateChanged;


  Future<FirebaseUser> anonLogin() async {
    
    FirebaseUser user = (await _auth.signInAnonymously()).user;
    
    return user;

  }

}
