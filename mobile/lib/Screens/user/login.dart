import 'package:flutter/material.dart';
import 'package:mobile/Screens/home/home.dart';
import 'package:mobile/Screens/user/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  //const ({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.red])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
        padding: const EdgeInsets.only(top: 150, left: 32, right: 32),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                _icon(),
                const SizedBox(height: 50),
                _inputField('Nom utilisateur', usernameController),
                const SizedBox(height: 20),
                _inputField('Mot de passe', passwordController,
                    isPassword: true),
                const SizedBox(height: 50),
                _loginBtn(),
                const SizedBox(height: 20),
                _extraText(),
              ])),
        ));
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 120,
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white));
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: border,
          focusedBorder: border),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Username : ${usernameController.text}");
        debugPrint("Password : ${passwordController.text}");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const Home()), // Remplacez AnotherScreen par le composant de destination que vous souhaitez afficher
        );
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: const Color.fromARGB(225, 228, 226, 226),
          foregroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 16)),
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Se connecter",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
    );
  }

  Widget _extraText() {
    return GestureDetector(
      onTap: () {
        handleClick();
      },
      child: const Text(
        "Vous n'avez pas de compte ? S'inscrire",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  void handleClick() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }
}
