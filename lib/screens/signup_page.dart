import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/colors.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  DateTime initialDate = DateTime.now();
  DateTime firstDate = DateTime(1900);
  DateTime lastDate = DateTime.now();
  bool isObscure = true;

  void onDateChanged(DateTime newDate) {
    setState(() {
      initialDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        backgroundColor: customSwatch,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/icons/signup.png', // Caminho da imagem
                  width: 340, // Tamanho da imagem (opcional)
                  height: 240, // Tamanho da imagem (opcional)
                ),
              ),

              // Campo de nome
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16), // Espaço entre os campos

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
                obscureText: isObscure, // Oculta a senha
              ),
              SizedBox(height: 16),

              // Campo de data de nascimento
              TextField(
                controller: _birthdayController,
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  hintText: 'Informe sua data de nascimento',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: firstDate,
                        lastDate: lastDate,
                      ).then((date) {
                        if (date != null) {
                          setState(() {
                            initialDate = date;
                            _birthdayController.text = DateFormat('dd/MM/yyyy')
                                .format(initialDate)
                                .toString();
                          });
                        }
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 16), // Espaço entre os campos

              // Botão de cadastro
              ElevatedButton(
                onPressed: () {
                  // Aqui você pode adicionar a lógica de login
                  print('Cadastro pressionado');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Largura do botão
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: customSwatch,
                ),
                child: Text('Cadastro'),
              ),
              SizedBox(height: 16), // Espaço entre o botão e as frases

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                  print('Ir para a tela de login');
                },
                child: Text(
                  'Já tem uma conta? Faça login',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
