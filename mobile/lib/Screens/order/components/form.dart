import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _cardNumber = '';
  String? _ccv = '';
  String? _month = '';
  String? _year = '';
  String? _fullname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Numéro de carte',
              ),
              onSaved: (value) {
                _cardNumber = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'CCV',
              ),
              onSaved: (value) {
                _ccv = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Month',
              ),
              onSaved: (value) {
                _month = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Month',
              ),
              onSaved: (value) {
                _year = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Month',
              ),
              onSaved: (value) {
                _fullname = value;
              },
            ),
            IconButton(
                icon: const Icon(Icons.volume_up),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Effectuez l'action souhaitée avec les données du formulaire
                    // Par exemple, vous pouvez les envoyer à une API ou les enregistrer localement
                  }
                }),
          ],
        ),
      ),
    );
  }
}
