import 'package:flutter/material.dart';
import 'package:grow_guard/views/home_page.dart';
import 'package:grow_guard/utils/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    SizedBox(height: 20),
                    InputBox(
                      text: "Password",
                      icon: Icons.key,
                      isPasswordField: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 40),
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
                        //TODO Add login to firebase
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child:
                            const Text("Login", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(height: 60),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
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

class InputBox extends StatelessWidget {
  const InputBox({
    super.key,
    required this.text,
    required this.icon,
    required this.isPasswordField,
    required this.controller,
  });

  final String text;
  final IconData icon;
  final TextEditingController controller;
  final bool isPasswordField;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      child: TextField(
        controller: controller,
        obscureText: isPasswordField,
        cursorColor: Colors.grey,
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          hintText: text,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 40, right: 20),
            child: Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
          ),
          filled: true,
          fillColor: Colors.grey[350],
        ),
      ),
    );
  }
}
