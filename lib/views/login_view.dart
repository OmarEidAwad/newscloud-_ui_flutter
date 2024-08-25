import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/main.dart';
import 'package:news_app_ui_setup/views/register_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  String? emailError;
  String? passwordError;

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  void validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        emailError = "Email must be not empty";
      } else if (!isValidEmail(value)) {
        emailError = "Invalid Email format";
      } else {
        emailError = null;
      }
    });
  }

  void validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        passwordError = "Password must not be empty";
      } else {
        passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: const Color.fromARGB(255, 235, 115, 24),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: const OutlineInputBorder(),
                  errorText: emailError,
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onChanged: validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                  errorText: passwordError,
                ),
                onChanged: validatePassword,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  validateEmail(emailController.text);
                  validatePassword(passwordController.text);

                  if (emailError == null && passwordError == null) {
                    {
                      // Attempt to sign in
                      // UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      //     email: emailController.text,
                      //     password: passwordController.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) {
                            return navigation();
                          },
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 235, 115, 24),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  TextButton(
                    child: Text('Register'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) {
                            return RegisterScreen();
                          },
                        ),
                      ); // Navigate to home screen
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
