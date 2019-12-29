import 'package:carros/pages/home_page.dart';
import 'package:carros/pages/login_api.dart';
import 'package:carros/utils/navigator.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text_form_field.dart';
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
            AppTextFormField(
              "Login",
              "Digite o login",
              controller: _controllerLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextFormField(
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
            AppButton(
              "Login",
              onPressed: _onClickLogin,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickLogin() async {
    bool formValidationContainsErrors = !_formKey.currentState.validate();

    if (formValidationContainsErrors) {
      return;
    }

    String login = _controllerLogin.text;
    String senha = _controllerSenha.text;

    bool loginSuccess = await LoginApi.login(login, senha);

    if (loginSuccess) {
      push(context, HomePage());
    }


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
