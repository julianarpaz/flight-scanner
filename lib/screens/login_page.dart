import 'package:flutter/material.dart';
import '../utils/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: customSwatch,
        shadowColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/icons/login.png', // Caminho da imagem
                  width: 240, // Tamanho da imagem (opcional)
                  height: 240, // Tamanho da imagem (opcional)
                ),
              ),

              // Campo de email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Digite seu email',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16), // Espaço entre os campos

              // Campo de senha
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                ),
                obscureText: isObscure,
              ),
              SizedBox(height: 16),

              // Botão de login
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                  print('Login pressionado');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Largura do botão
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: customSwatch,
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 16),

              // Frase "Esqueceu sua senha?"
              TextButton(
                onPressed: () {
                  // Ação para esquecer a senha (exemplo)
                  print('Esqueceu a senha');
                },
                child: Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                  print('Ir para a tela de cadastro');
                },
                child: Text(
                  'Não tem uma conta? Cadastre-se',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
