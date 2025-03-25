import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  void _cancel() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img_fundologin.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Nome", filled: true, fillColor: Colors.white),
                  validator: (value) => value!.isEmpty ? "Informe seu nome" : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "E-mail", filled: true, fillColor: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value!.isEmpty ? "Informe um e-mail válido" : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _cpfController,
                  decoration: InputDecoration(labelText: "CPF", filled: true, fillColor: Colors.white),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? "Informe seu CPF" : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "Senha", filled: true, fillColor: Colors.white),
                  obscureText: true,
                  validator: (value) => value!.length < 6 ? "A senha deve ter pelo menos 6 caracteres" : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(labelText: "Confirmar Senha", filled: true, fillColor: Colors.white),
                  obscureText: true,
                  validator: (value) => value != _passwordController.text ? "As senhas não coincidem" : null,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _register,
                      child: Text("Cadastrar"),
                    ),
                    ElevatedButton(
                      onPressed: _cancel,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text("Cancelar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
