import 'package:flutter/material.dart';
import 'package:grow_guard/user_auth/error_handling.dart';
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
    final errorCode = useState("");
    final isLoggingIn = useState(false);

    void signIn() async {
      isLoggingIn.value = true;

      String email = emailController.text;
      String password = passwordController.text;

      Object? result = await auth.signInWithEmailAndPassword(email, password);

      isLoggingIn.value = false;

      if (result is User) {
        debugPrint("User successfully signed in!");
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        errorCode.value = ErrorHandling.handleError(result.toString());
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
                    InputBox(
                      text: "Password",
                      icon: Icons.key,
                      isPasswordField: true,
                      controller: passwordController,
                      errorCode: errorCode.value,
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
                        child: isLoggingIn.value
                            ? const SizedBox(
                                height: 26,
                                width: 26,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
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
