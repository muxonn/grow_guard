import 'package:flutter/material.dart';
import 'package:grow_guard/views/home_page.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grow_guard/utils/input_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_guard/user_auth/firebase_auth_services.dart';
import 'package:grow_guard/views/login_page.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService auth = FirebaseAuthService();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final repeatPasswordController = useTextEditingController();
    final errorCode = useState("");

    void signUp() async {
      String email = emailController.text;
      String password = passwordController.text;
      String repeatPassword = repeatPasswordController.text;

      if (password != repeatPassword) {
        print("Passwords must be the same!");

        errorCode.value = "Passwords are not the same";
        return;
      }

      Object? user = await auth.signUpWithEmailAndPassword(email, password);

      if (user is User) {
        print("User successfully signed up!");
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        print("Some error occured");
        errorCode.value = user.toString();
      }
    }

    final size = MediaQuery.of(context).size;
    useEffect(() {});

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Image.asset(
                'assets/images/logo-simple.png',
                width: 70,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width - 50,
                height: size.height - 180,
                margin: EdgeInsets.only(top: 30),
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
                      "Sign Up",
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(height: 30),
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
                    SizedBox(height: 10),
                    InputBox(
                      text: "Repeat password",
                      icon: Icons.key,
                      isPasswordField: true,
                      controller: repeatPasswordController,
                      errorCode: errorCode.value,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 59,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.black,
                        ),
                        onPressed: signUp,
                        child: const Text("Sign Up",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Log In",
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
