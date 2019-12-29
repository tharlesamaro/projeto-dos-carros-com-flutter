import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          _textFormField("Login", "Digite o login"),
          SizedBox(
            height: 10,
          ),
          _textFormField("Senha", "Digite a senha", isPassword: true),
          SizedBox(
            height: 20,
          ),
          _button("Login"),
        ],
      ),
    );
  }

  _button(String text) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  TextFormField _textFormField(String label, String hint,
      {bool isPassword = false}) {
    return TextFormField(
      obscureText: isPassword,
      style: TextStyle(
        fontSize: 25,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 25,
          color: Colors.grey,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
