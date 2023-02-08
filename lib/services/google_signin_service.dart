import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // 'https://www.googleapis.com/auth/contacts.readonly',//Access to contacts
    ],
  );

  static Future<GoogleSignInAccount?> singInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account?.authentication;

      // print("ID TOKEN : $googleKey");
      // print(googleKey!.idToken);

      final uriGoogle = Uri(
          scheme: "https",
          host: "mighty-meadow-72333.herokuapp.com",
          path: "/google");

      final response =
          await http.post(uriGoogle, body: {"token": googleKey!.idToken});

      print("====BACKEND====");
      print(response.body);

      return account;
    } catch (e) {
      print("Error en Google Singin: $e");
      return null;
    }
  }

  static Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
  }
}
