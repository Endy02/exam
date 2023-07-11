import 'package:flutter/material.dart';
import 'package:mobile/Screens/user/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  //const ({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>{

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();

//String get _url => "./login.dart";


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors:[
                Colors.blue,
                Colors.red
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page()
  {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(

            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  _icon(),
                  const SizedBox(height: 50),
                  _inputField('Nom utilisateur',usernameController),
                  const SizedBox(height: 20),
                  _inputField('Mot de passe',passwordController,isPassword: true),
                  const SizedBox(height: 20),
                  _inputField('Confirmer mot de passe',passwordConfirmController),
                  const SizedBox(height: 20),
                  _inputField('Nom',firstnameController),
                  const SizedBox(height: 20),
                  _inputField('Prenoms',secondnameController),
                  const SizedBox(height: 50),
                  _loginBtn(),
                  const SizedBox(height: 20),
                  _extraText(),
                ]
            )
        ),
      ),
    );
  }

  Widget _icon()
  {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: Colors.white,size: 120,),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,{isPassword=false})
  {
    var border = OutlineInputBorder(
        borderRadius:BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.white)
    );
    return TextField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: border,
          focusedBorder: border
      ),
      obscureText: isPassword,
    );
  }

  Widget _loginBtn()
  {
    return ElevatedButton(
      onPressed: (){
        debugPrint("Nom utilisateur : ${usernameController.text}");
        debugPrint("Mot de passe : ${passwordController.text}");
        debugPrint("Confirmer mot de passe : ${passwordConfirmController.text}");
        debugPrint("Nom : ${firstnameController.text}");
        debugPrint("Prenoms : ${secondnameController.text}");
      },
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: const Color.fromARGB(225, 228, 226, 226),
          foregroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 16)
      ),
      child: const SizedBox(
          width: double.infinity,
          child: Text("S'inscrire",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )),
    );
  }

  Widget _extraText(){
    return GestureDetector(
      onTap: () {
        handleClick();
      },
      child: const Text("Avez-vous un compte ? Se connecter ",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white
            ),

          ),
    );
    
  }

  void handleClick() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
          const Login()), // Remplacez AnotherScreen par le composant de destination que vous souhaitez afficher
    );
  }


}





