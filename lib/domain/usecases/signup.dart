import 'package:express_app/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupUseCase{
  AuthRepository repoImpl ;
  SignupUseCase({required this.repoImpl});

  Future<UserCredential?> signupUseCase(String email,String password){
    return repoImpl.signUp(userEmail: email, userPassword: password);
  }
}