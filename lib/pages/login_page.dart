import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _controllerLogin = TextEditingController();

  final _controllerSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _textFormField(
              "Login",
              "Digite o login",
              controller: _controllerLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(
              height: 10,
            ),
            _textFormField(
              "Senha",
              "Digite a senha",
              isPassword: true,
              controller: _controllerSenha,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            _button("Login", _onClickLogin),
          ],
        ),
      ),
    );
  }

  _textFormField(
    String label,
    String hint, {
    bool isPassword = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
    TextInputType keyboardType,
    TextInputAction textInputAction,
    FocusNode focusNode,
    FocusNode nextFocus,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String value) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
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
    bool formValidationContainsErrors = !_formKey.currentState.validate();

    if (formValidationContainsErrors) {
      return;
    }

    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;

    print("Login: $login, Senha: $senha");
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return "Campo login é obrigatório";
    }
    return null;
  }

  String _validateSenha(String value) {
    if (value.isEmpty) {
      return "Campo senha é obrigatório";
    }

    if (value.length < 4) {
      return "Digite pelo menos 4 caracteres";
    }

    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
