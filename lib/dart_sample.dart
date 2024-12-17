import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'customtoolbar.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(12, 192, 223, .1),
  100: const Color.fromRGBO(12, 192, 223, .2),
  200: const Color.fromRGBO(12, 192, 223, .3),
  300: const Color.fromRGBO(12, 192, 223, .4),
  400: const Color.fromRGBO(12, 192, 223, .5),
  500: const Color.fromRGBO(12, 192, 223, .6),
  600: const Color.fromRGBO(12, 192, 223, .7),
  700: const Color.fromRGBO(12, 192, 223, .8),
  800: const Color.fromRGBO(12, 192, 223, .9),
  900: const Color.fromRGBO(12, 192, 223, 1),
};

MaterialColor customSwatch = MaterialColor(0xFF0CC0DF, color);

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/home': (context) => HomePage(),
      '/login': (context) => LoginPage(),
      '/signup': (context) => SignUpPage(),
      '/notifications': (context) => const NotificationsPage(),
      '/analytics': (context) => const PriceMonitoringPage(),
      '/settings': (context) => const SettingsPage(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: customSwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  print('Login pressionado');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Largura do botão
                  padding: EdgeInsets.symmetric(vertical: 16),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  final List<Widget> _pages = [
    const Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Notifications', style: TextStyle(fontSize: 24))),
    const Center(
        child: Text('Price Monitoring', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NotificationsPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PriceMonitoringPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
        break;
      default:
        setState(() {
          _selectedIndex = index;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0CC0DF),
        elevation: 0,
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de Pesquisa
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Flights',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),

          // Categorias
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryIcon(Icons.grid_view, 'All'),
                _buildCategoryIcon(Icons.hotel, 'Hotel'),
                _buildCategoryIcon(Icons.terrain, 'Hill'),
                _buildCategoryIcon(Icons.beach_access, 'Beach'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Top Destinations
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Top Destinations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Show All',
                  style: TextStyle(color: Color(0xFF0CC0DF)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Destinations
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildDestinationCard(
                  'Ubud Bali, Indonesia',
                  'Emirates',
                  'assets/icons/indonesia.jpg',
                ),
                _buildDestinationCard(
                  'Raja Ampat, Indonesia',
                  'Qatar Airways',
                  'assets/icons/indonesia-2.jpg',
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Recent Searches
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Recent Searches',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 8),

          // Pesquisas Recentes
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              //child: Image.asset('assets/icons/not-found.jpg'),
            ),
          ),
          _pages[_selectedIndex],
        ],
      ),
      // Barra de Navegação Fixa
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF0CC0DF),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // Widget para um ícone de categoria
  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xFF0CC0DF),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  // Widget para um cartão de destino
  Widget _buildDestinationCard(
      String title, String subtitle, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        width: 200,
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF0CC0DF),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Section
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                            'assets/icons/profile-icon-design-free-vector.jpg'),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: customSwatch,
                          child: const Icon(
                            Icons.edit,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Jane Doe',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'jane.doe@gmail.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // General Settings Section
            buildSectionTitle('General Settings'),
            buildListTile(
              icon: Icons.dark_mode,
              title: 'Mode',
              subtitle: 'Dark & Light',
              trailing: Switch(
                value: false,
                onChanged: (value) {
                  // Add the logic here
                },
              ),
            ),
            buildListTile(
              icon: Icons.key,
              title: 'Change Password',
              onTap: () {},
            ),
            buildListTile(
              icon: Icons.language,
              title: 'Language',
              onTap: () {},
            ),
            // Information Section
            buildSectionTitle('Information'),
            buildListTile(
              icon: Icons.airplanemode_active,
              title: 'My Travels',
              onTap: () {},
            ),
            buildListTile(
              icon: Icons.description,
              title: 'Terms & Conditions',
              onTap: () {},
            ),
            buildListTile(
              icon: Icons.share,
              title: 'Share the app',
              onTap: () {},
            ),
            buildListTile(
              icon: Icons.logout,
              title: 'Sign out',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget buildListTile({
    required IconData icon,
    required String title,
    String? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class PriceMonitoringPage extends StatefulWidget {
  const PriceMonitoringPage({super.key});

  @override
  State<PriceMonitoringPage> createState() => _PriceMonitoringPageState();
}

class _PriceMonitoringPageState extends State<PriceMonitoringPage> {
  
  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Price Monitoring',
      body: const Center(
          child: Text('Notifications Page', style: TextStyle(fontSize: 24))),
      selectedIndex: 2,
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Notifications',
      body: const Center(
          child: Text('Notifications Page', style: TextStyle(fontSize: 24))),
      selectedIndex: 1,
    );
  }
}
