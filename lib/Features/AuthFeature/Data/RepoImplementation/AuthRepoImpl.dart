import 'package:firebase_auth/firebase_auth.dart';
import 'package:tennis_app/Core/Utils/ConstantsNames.dart';
import 'package:tennis_app/Core/Failure/RequestFailure.dart';
import 'package:tennis_app/Core/Failure/FirebaseFailureHandler.dart';
import 'package:tennis_app/Features/AuthFeature/Data/Models/UserModel.dart';
import 'package:tennis_app/Features/AuthFeature/Domain/Entities/LoginEntity.dart';
import 'package:tennis_app/Features/AuthFeature/Data/DataSource/Registration.dart';
import 'package:tennis_app/Features/AuthFeature/Domain/RepoInterface/AuthRepo.dart';
import 'package:tennis_app/Features/AuthFeature/Domain/Entities/RegisterEntity.dart';
import 'package:tennis_app/Features/AuthFeature/Data/DataSource/FirebaseFirestoreServices.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<RequestResault<UserModel, FirebaseFailureHandler>> login(LoginEntity loginData, String password) async {
    try {
      UserCredential user = await SignIn.signIn(loginData.email!, password);
      String fullName = await Firestore.getField(collectionPath: ConstantNames.usersDataCollection, docName: user.user!.uid, key: ConstantNames.fullName);
      UserModel userModel = UserModel(email: loginData.email, uid: user.user!.uid, fullName: fullName);
      ConstantNames.userModel = userModel;
      return RequestResault.success(userModel);
    } catch (e) {
      return RequestResault.failure(FirebaseFailureHandler(e));
    }
  }

  @override
  Future<RequestResault<UserModel, FirebaseFailureHandler>> register(RegisterEntity registerData, String password) async {
    try {
      UserCredential user = await Register.register(registerData.toMap(), password);
      UserModel userModel = UserModel(email: registerData.email, uid: user.user!.uid, fullName: registerData.fullName);
      ConstantNames.userModel = userModel;
      return RequestResault.success(userModel);
    } catch (e) {
      return RequestResault.failure(FirebaseFailureHandler(e));
    }
  }

  @override
  Future<RequestResault<UserModel, FirebaseFailureHandler>> forgetPassword(String email) async {
    try {
      await AccountData.resetPassword(email);
      return RequestResault.success(UserModel());
    } catch (e) {
      return RequestResault.failure(FirebaseFailureHandler(e));
    }
  }
}
