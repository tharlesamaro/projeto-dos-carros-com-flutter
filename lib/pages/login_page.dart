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
          Text("Login"),
          TextField(),
          SizedBox(height: 20,),
          Text("Senha"),
          TextFormField(
            obscureText: true,
          ),
          SizedBox(height: 20,),
          Container(
            height: 46,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
