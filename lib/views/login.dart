import 'package:eventvalle/blocs/auth/auth_bloc.dart';
import 'package:eventvalle/views/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool emailFocus = false;
  bool passwordFocus = false;

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {
        emailFocus = emailFocusNode.hasFocus;
      });
    });
    passwordFocusNode.addListener(() {
      setState(() {
        passwordFocus = passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 250, 250, 250),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo1.png',
                  height: 190,
                  width: 230,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: emailFocus ? Colors.pink : Colors.grey.shade800,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.mail, color: Colors.grey.shade800),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        controller: emailController,
                        focusNode: emailFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Correo Electrónico',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: passwordFocus ? Colors.pink : Colors.grey.shade800,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lock, color: Colors.grey.shade800),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: GestureDetector(
                  onTap: () {
                    print("Olvidaste tu contraseña?");
                  },
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text;
                    if (email.isNotEmpty && email.endsWith("univalle.edu")) {
                      context.read<AuthBloc>().add(AuthSignInWithEmailPassword(
                            email: email,
                            password: passwordController.text,
                          ));
                    } else {
                      showToast(
                          "Correo electrónico no válido para la autenticación");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF993366),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    minimumSize: const Size(300, 0),
                    elevation: 0, // Sin sombra
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Center(
                child: GestureDetector(
                  child: const Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    print("Login with Microsoft");
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    minimumSize: const Size(300, 0),
                    elevation: 0, // Sin sombra
                  ),
                  icon: const FaIcon(FontAwesomeIcons.microsoft),
                  label: const Text(
                    '  Login with Microsoft',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInView()),
                    );
                  },
                  child: const Text(
                    'No tienes una cuenta? Crear Cuenta',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.pink,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
