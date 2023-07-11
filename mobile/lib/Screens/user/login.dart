import 'package:flutter/material.dart';
import 'package:mobile/Screens/home/home.dart';
import 'package:mobile/Screens/user/register.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        login(usernameController.text, passwordController.text);
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

Future<void> login(String username, String password) async {
  // API endpoint for login
  const String apiUrl = 'http://localhost:8000/user/login';

  // Create the request body
  final Map<String, dynamic> data = {
    'username': "Edouard PROUST",
    'password': "password",
  };

  try {
    // Make the POST request to the login API
    final response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Successful login
      print('bravo : ${response.statusCode}');
      final responseData = jsonDecode(response.body);
      print('user : ${responseData}');
      // Process the response data as needed
      // e.g., save user information, authentication token, etc.
    } else {
      // Failed login
      print('Login failed. Status code: ${response.statusCode}');
      // Handle the error response
      final errorData = jsonDecode(response.body);
      // Process the error data and display appropriate error messages
    }
  } catch (e) {
    // Error occurred during the API call
    print('An error occurred: $e');
    // Handle the error
  }
}
