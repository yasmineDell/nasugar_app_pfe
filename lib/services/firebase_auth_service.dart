/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sommelier_du_parfum/models/customer.dart';
import 'package:sommelier_du_parfum/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;

  Customer _customerFromFirebaseUser(User firebaseUser) => firebaseUser == null
      ? null
      : Customer(
          uid: firebaseUser.uid,
          name: firebaseUser.displayName,
          email: firebaseUser.email,
        );
  // Stream<CustomUser> get user => _auth
  //     .authStateChanges()
  //     .map((User firebaseUser) => _userFromFirebaseUser(firebaseUser));
  @override
  Stream<Customer> get onAuthStateChanges => _auth.authStateChanges().map(
        _customerFromFirebaseUser,
      );
  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<Customer> signInAnon() async {
    try {
      final UserCredential _credentials = await _auth.signInAnonymously();
      return _customerFromFirebaseUser(_credentials.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<Customer> signInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      final UserCredential _credentials =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _customerFromFirebaseUser(_credentials.user);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Customer> createUserWithEmailAndPassword(
      {String email, String password}) async {
    try {
      final UserCredential _credentials =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return _customerFromFirebaseUser(_credentials.user);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Customer> signInWithGoogle() async {
    print('Sign in with google');
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return this._customerFromFirebaseUser(userCredential.user);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          //show snack bar error
          print('The account already exists with a different credential.');
        } else if (e.code == 'invalid-credential') {
          print('Error occurred while accessing credentials. Try again.');
        }
      } catch (e) {
        // handle the error here
        // ScaffoldMessenger.of(context).showSnackBar(
        //   Authentication.customSnackBar(
        //     content: 'Error occurred using Google Sign-In. Try again.',
        //   ),
        // );
        print('Error occurred using Google Sign-In. Try again');
      }
    }
    return null;
  }

  @override
  Future<bool> isSignInWithEmailLink(String link) async {
    return _auth.isSignInWithEmailLink(link);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> sendSignInWithEmailLink({
    String email,
    String url,
    bool handleCodeInApp,
    String iOSBundleID,
    String androidPackageName,
    bool androidInstallIfNotAvailable,
    String androidMinimumVersion,
  }) async {
    return await _auth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: ActionCodeSettings(
        url: url,
        handleCodeInApp: handleCodeInApp,
        iOSBundleId: iOSBundleID,
        androidPackageName: androidPackageName,
        androidMinimumVersion: androidMinimumVersion,
        androidInstallApp: androidInstallIfNotAvailable,
      ),
    );
  }

  @override
  Future<void> sendResetPasswordEmail({String email}) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

//   @override
//   Future<CustomUser> signInWithFacebook(BuildContext context) async {
//     String brewAppId = "3076513842471757";
//     String redirectURL = "https://www.facebook.com/connect/login_success.html";
//     final String result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CustomWebView(
//           selectedURL:
//               "https://www.facebook.com/dialog/oauth?client_id=$brewAppId&redirect_uri=$redirectURL&response_type=token&scope=email,public_profile,",
//         ),
//         maintainState: true,
//       ),
//     );

//     //pod 'FBSDKLoginKit'
//     if (result != null) {
//       try {
//         final facebookAuthCredential = FacebookAuthProvider.credential(result);
//         final UserCredential userCredential =
//             await _auth.signInWithCredential(facebookAuthCredential);
//         return _userFromFirebaseUser(userCredential.user);
//       } catch (e) {
//         print(e);
//         return null;
//       }
//     }

//     // https://github.com/roughike/flutter_facebook_login/issues/210
// //    final FacebookLogin facebookLogin = FacebookLogin();
// //    facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
// //    final FacebookLoginResult loginResult = await facebookLogin.logIn(<String>['public_profile']);
// //    if (loginResult.accessToken != null) {
// //      final UserCredential userCredential = await _auth.signInWithCredential(
// //        FacebookAuthProvider.credential(
// //          loginResult.accessToken.token,
// //        ),
// //      );
// //      return _userFromFirebase(userCredential.user);
// //    } else {
// //      throw PlatformException(code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');
// //    }
//   }

}*/
