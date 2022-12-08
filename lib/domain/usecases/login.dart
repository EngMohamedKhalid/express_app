import 'package:express_app/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUseCase{
  final AuthRepository repoImpl;

  LoginUseCase(this.repoImpl);

  Future<UserCredential?> loginUseCase(String email , String password){
    return repoImpl.signIn(userEmail: email, userPassword: password);
  }

}