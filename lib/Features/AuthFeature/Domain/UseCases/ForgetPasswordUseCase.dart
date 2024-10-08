import 'package:firebase_auth/firebase_auth.dart';
import 'package:tennis_app/Core/Failure/RequestFailure.dart';
import 'package:tennis_app/Features/AuthFeature/Data/DataSource/Authentication.dart';
import 'package:tennis_app/Features/AuthFeature/Domain/RepoInterface/AuthRepo.dart';

class ForgetPasswordUseCase {
  ForgetPasswordUseCase({required this.authRepo, required this.accountData});

  final AuthRepo authRepo;
  final AccountData accountData;

  Future<RequestResault> forgetPassword(String email) async {
    try {
      await accountData.getUIDFromFirestore(email);
      return await authRepo.forgetPassword(email);
    } on RangeError catch (_) {
      throw FirebaseAuthException(code: "user-not-found");
    } catch (e) {
      return RequestResault.failure(e);
    }
  }
}
