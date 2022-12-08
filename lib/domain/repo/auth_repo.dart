import 'package:express_app/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';




abstract class AuthRepository{
  Future<UserCredential?> signIn({required String userEmail , required String userPassword});
  Future<UserCredential?> signUp({required String userEmail ,required String userPassword});
  Future<bool> createProfile(UserModel model);
}