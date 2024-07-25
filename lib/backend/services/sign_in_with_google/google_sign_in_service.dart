import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      // scopes: [
      //   'email',
      //   'https://www.googleapis.com/auth/contacts.readonly',
      // ],
      );

  Future<Map<String, String>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return {};
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;
      print(accessToken);
      print("heythere");

      return {
        'accessToken': accessToken ?? '',
        'idToken': idToken ?? '',
      };
    } catch (error) {
      print('Error during Google Sign-In: $error');
      return {};
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
