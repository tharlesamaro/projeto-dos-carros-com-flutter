import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _controllerLogin = TextEditingController();
  final _controllerSenha = TextEditingController();

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
          _textFormField("Login", "Digite o login",
              controller: _controllerLogin),
          SizedBox(
            height: 10,
          ),
          _textFormField("Senha", "Digite a senha",
              isPassword: true, controller: _controllerSenha),
          SizedBox(
            height: 20,
          ),
          _button("Login", _onClickLogin),
        ],
      ),
    );
  }

  _textFormField(String label, String hint,
      {bool isPassword = false, TextEditingController controller}) {
    return TextFormField(
      controller: controller,
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

  _button(String text, Function onPressed) {
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
        onPressed: onPressed,
      ),
    );
  }

  void _onClickLogin() {
    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;

    print("Login: $login, Senha: $senha");
  }
}
