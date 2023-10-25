import 'package:firebase_auth/firebase_auth.dart';

//Fungsi signup
Future<void> signUp(String email, String password)async{
  try{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  //signup berhasil
  }catch (e){
  //  pesan gagal
    print(e.toString());
  }
}

//fungsi login
Future<void> signIn(String email, String password) async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }catch (e){
    print(e.toString());
  }
}


//logout
Future<void> signOut()async{
  await FirebaseAuth.instance.signOut();
}