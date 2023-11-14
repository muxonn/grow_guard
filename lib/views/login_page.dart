import 'package:flutter/material.dart';
import 'package:grow_guard/views/home_page.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grow_guard/utils/input_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_guard/user_auth/firebase_auth_services.dart';
import 'package:grow_guard/views/signup_page.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService auth = FirebaseAuthService();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    void signIn() async {
      String email = emailController.text;
      String password = passwordController.text;

      User? user = await auth.signInWithEmailAndPassword(email, password);

      if (user != null) {
        print("User successfully signed in!");
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        print("Wrong email or password");
      }
    }

    final size = MediaQuery.of(context).size;
    useEffect(() {});

    return Scaffold(
      backgroundColor: forestGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Image.asset(
                'assets/images/logo-simple-alternative.png',
                width: 70,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width - 50,
                height: size.height - 210,
                margin: EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Log in",
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(height: 40),
                    InputBox(
                      text: "Email",
                      icon: Icons.person,
                      isPasswordField: false,
                      controller: emailController,
                    ),
                    SizedBox(height: 10),
                    InputBox(
                      text: "Password",
                      icon: Icons.key,
                      isPasswordField: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 59,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: forestGreen,
                        ),
                        onPressed: signIn,
                        child:
                            const Text("Login", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(height: 30),
                    //Text("Wrong email or password!"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: coldGray, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
