import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:projet_5/constantes.dart';
import 'package:projet_5/helper/show_snack_bar.dart';
import 'package:projet_5/pages/chat_page.dart';
import 'package:projet_5/pages/register_page.dart';
import 'package:projet_5/widgets/custom_button.dart';
import 'package:projet_5/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  static String id = 'loginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 75,
                ),
                Image.asset(
                  "assets/images/scholar.png",
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Scholar Chat",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "pacifico",
                          fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustemTextFormField(
                  hintText: "Email",
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustemTextFormField(
                  hintText: "Password",
                  onChanged: (data) {
                    password = data;
                  },
                  obscure: true,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                      } catch (e) {
                        showSnackBar(context, 'There was an error: $e');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: "Sign In",
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: Text(
                        " Register",
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      // Connexion réussie, vous pouvez faire quelque chose ici si nécessaire
      Navigator.pushNamed(context, ChatPage.id, arguments: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      } else {
        showSnackBar(context, 'Error: Wrong email or password inccorect');
      }
    } catch (e) {
      showSnackBar(context, 'There was an error: $e');
    }
  }
}
