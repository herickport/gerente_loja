import 'package:flutter/material.dart';
import 'package:gerente_loja/blocs/login_bloc.dart';
import 'package:gerente_loja/screens/login/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.store,
                    color: Colors.pinkAccent,
                    size: 160,
                  ),
                  InputField(
                    icon: Icons.person_outline,
                    hint: "Usuário",
                    obscure: false,
                    stream: _loginBloc.outEmail,
                    onChanged: _loginBloc.changeEmail,
                  ),
                  InputField(
                    icon: Icons.lock_outline,
                    hint: "Senha",
                    obscure: true,
                    stream: _loginBloc.outPassword,
                    onChanged: _loginBloc.changePassword,
                  ),
                  SizedBox(height: 32),
                  StreamBuilder<bool>(
                    stream: _loginBloc.outSubmitValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        height: 50,
                        child: RaisedButton(
                          child: Text("Entrar"),
                          color: Colors.pinkAccent,
                          textColor: Colors.white,
                          onPressed: snapshot.hasData ? _loginBloc.submit : null,
                          disabledColor: Colors.pinkAccent.withAlpha(140),
                        ),
                      );
                    }
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
