import 'package:express_app/data/models/user_model.dart';
import 'package:express_app/domain/repo/auth_repo.dart';


class CreateProfileUseCase{
  AuthRepository repoImpl;

  CreateProfileUseCase({required this.repoImpl});

  Future<bool> createProfileUseCase(UserModel user){
    return repoImpl.createProfile(user);
  }
}