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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/notifications': (context) => NotificationsPage(),
        '/analytics': (context) => PriceMonitoringPage(),
        '/settings': (context) => const SettingsPage(),
        '/mytravels': (context) => const MyTravelsPage(),
        '/search': (context) => const SearchTravelsPage(),
        '/searchResults': (context) => SearchResultsPage(),
      },
      theme: ThemeData(
        primarySwatch: customSwatch,
        primaryColor: customSwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Home Page',
      body: Column(
        children: [
          // Barra de Pesquisa
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                 Navigator.pushNamed(context, '/search');
              },
            child: IgnorePointer(
              child: TextField(
              readOnly: true,
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
            )
            )
          ),

          // Categorias
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryIcon(Icons.grid_view, 'All'), // adicionar ação aos botões
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
        ],
      ),
      selectedIndex: 0,
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
              onTap: () {
                Navigator.pushNamed(context, '/mytravels');
              },
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

class NotificationsPage extends StatelessWidget {
  NotificationsPage({Key? key}) : super(key: key);

  // substituir as URL 
  final List<Map<String, String>> notifications = [
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Phuket - Thailand',
      'subtitle': 'Singapore',
      'details': 'DELAYED - August 11, 2024, 23:40',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Phuket - Thailand',
      'subtitle': 'Singapore',
      'details': 'DELAYED - August 11, 2024, 21:10',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Singapore - Singapore',
      'subtitle': 'Hanoi',
      'details': 'Boarding at Gate 11',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Hanoi - Vietnam',
      'subtitle': 'Shanghai',
      'details': 'Boarding at Gate Q1',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Shanghai - China',
      'subtitle': 'San Francisco',
      'details': 'Boarding at Gate A0',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Notifications',
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        notification['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            notification['subtitle']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            notification['details']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: OutlinedButton(
                              onPressed: () {},
                              child: const Text('Details'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      selectedIndex: 1,
    );
  }
}

class MyTravelsPage extends StatelessWidget {
  const MyTravelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Travels'),
        backgroundColor: const Color(0xFF0CC0DF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                _buildTravelCard(
                  'Ubud Bali, Indonesia',
                  'Emirates',
                  'assets/icons/indonesia.jpg',
                ),
                _buildTravelCard(
                  'Raja Ampat, Indonesia',
                  'Qatar Airways',
                  'assets/icons/indonesia-2.jpg',
                ),
              ],
            ),
          ),
        ]
      ),

    );
  }

  Widget _buildTravelCard(
      String title, String subtitle, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        //width: 200,
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
                child: Image.asset( // trocar para Image.network e hospedar as imagens em algum lugar e passar o path delas aqui
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

class SearchTravelsPage extends StatefulWidget {
  const SearchTravelsPage({Key? key}) : super(key: key);

  @override
  State<SearchTravelsPage> createState() => _SearchTravelsPageState();
}

class _SearchTravelsPageState extends State<SearchTravelsPage> {
  String tripType = "Round Trip"; // Default trip type
  DateTime? departureDate;
  DateTime? returnDate;

  // Para Multi City
  DateTime? multiCityDate1;
  DateTime? multiCityDate2;

  // Função para abrir o calendário e selecionar a data
  Future<void> _selectDate(BuildContext context, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Search Travels"),
      backgroundColor: const Color(0xFF0CC0DF),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip type buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tripTypeButton("Round Trip"),
                _tripTypeButton("One Way"),
                _tripTypeButton("Multi City"),
              ],
            ),
            const SizedBox(height: 16),

            // Fields based on trip type
            if (tripType == "Round Trip" || tripType == "One Way")
              Column(
                children: [
                  _locationField("INDONESIA, HLP"),
                  const SizedBox(height: 8),
                  _locationField("THAILAND, BKK"),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Flexible(
                        child: _dateField(
                          label: "Departure",
                          date: departureDate,
                          onTap: () => _selectDate(context, (date) {
                            setState(() {
                              departureDate = date;
                            });
                          }),
                        ),
                      ),
                      if (tripType == "Round Trip")
                        const SizedBox(width: 16),
                      if (tripType == "Round Trip")
                        Flexible(
                          child: _dateField(
                            label: "Return",
                            date: returnDate,
                            onTap: () => _selectDate(context, (date) {
                              setState(() {
                                returnDate = date;
                              });
                            }),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            if (tripType == "Multi City")
              Column(
                children: [
                  _locationField("INDONESIA, HLP"),
                  const SizedBox(height: 8),
                  _locationField("THAILAND, BKK"),
                  const SizedBox(height: 16),
                  _dateField(
                    label: "Departure",
                    date: multiCityDate1,
                    onTap: () => _selectDate(context, (date) {
                      setState(() {
                        multiCityDate1 = date;
                      });
                    }),
                  ),
                  const SizedBox(height: 16),
                  _locationField("THAILAND, BKK"),
                  const SizedBox(height: 8),
                  _locationField("CHINA, PEK"),
                  const SizedBox(height: 16),
                  _dateField(
                    label: "Departure",
                    date: multiCityDate2,
                    onTap: () => _selectDate(context, (date) {
                      setState(() {
                        multiCityDate2 = date;
                      });
                    }),
                  ),
                ],
              ),
            const SizedBox(height: 24),

            // Search button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResultsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0CC0DF),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: const Text(
                "Search",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  // Botão para selecionar o tipo de viagem
  Widget _tripTypeButton(String type) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          tripType = type;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: tripType == type ? const Color(0xFF0CC0DF) : Colors.white,
        foregroundColor: tripType == type ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFF0CC0DF)),
        ),
      ),
      child: Text(type),
    );
  }

  // Campo para localização
  Widget _locationField(String location) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.flight, color: Color(0xFF0CC0DF)),
        hintText: location,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Campo para data
  Widget _dateField({required String label, required DateTime? date, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date != null ? DateFormat('dd/MM/yyyy - EEEE').format(date) : label,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              const Icon(Icons.calendar_today, color: Color(0xFF0CC0DF)),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchResultsPage extends StatefulWidget {
  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  final List<Map<String, String>> flightResults = [
    {
      'image': 'https://via.placeholder.com/150', // Substitua com URLs reais
      'title': 'Bangkok - Thailand',
      'subtitle': 'Koh Lipe',
      'duration': 'Direct Flight - 3h 33min',
      'price': '\$357.00',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Bangkok - Thailand',
      'subtitle': 'Phuket',
      'duration': 'Direct Flight - 3h 33min',
      'price': '\$357.00',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Bangkok - Thailand',
      'subtitle': 'Chiang Mai',
      'duration': 'Direct Flight - 3h 33min',
      'price': '\$357.00',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Bangkok - Thailand',
      'subtitle': 'Krabi',
      'duration': 'Direct Flight - 3h 33min',
      'price': '\$357.00',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Bangkok - Thailand',
      'subtitle': 'Bangkok',
      'duration': 'Direct Flight - 3h 33min',
      'price': '\$357.00',
    },
  ];

  final Set<int> likedItems = {}; // Armazena os índices dos itens curtidos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Indonesia - Thailand',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '21 nov - 28 nov',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF0CC0DF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filtros
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Flights to Thailand',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Icon(Icons.show_chart, color: Color(0xFF0CC0DF)),
                    SizedBox(width: 8),
                    Switch(value: false, onChanged: null),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Botões de filtro
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _filterButton(context, 'Suggested', isSelected: true),
                _filterButton(context, 'Cheapest'),
                _filterButton(context, 'Faster'),
              ],
            ),
            const SizedBox(height: 16),

            // Lista de resultados
            Expanded(
              child: ListView.builder(
                itemCount: flightResults.length,
                itemBuilder: (context, index) {
                  final flight = flightResults[index];
                  final isLiked = likedItems.contains(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            // Imagem do voo
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                flight['image']!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Informações do voo
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    flight['title']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    flight['subtitle']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    flight['duration']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Preço e botão de detalhes
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  flight['price']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0CC0DF),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Ação do botão Details
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF0CC0DF),
                                    minimumSize: const Size(80, 30),
                                  ),
                                  child: const Text('Details'),
                                ),
                              ],
                            ),

                            // Ícone de favorito
                            IconButton(
                              icon: Icon(
                                isLiked ? Icons.favorite : Icons.favorite_border,
                                color: isLiked ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (isLiked) {
                                    likedItems.remove(index);
                                  } else {
                                    likedItems.add(index);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Botão de filtro
  Widget _filterButton(BuildContext context, String label, {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: () {
        // Ação do botão de filtro
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFF0CC0DF) : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: const Color(0xFF0CC0DF)),
        ),
      ),
      child: Text(label),
    );
  }
}

class PriceMonitoringPage extends StatelessWidget {
  final List<Map<String, String>> monitoredFlights = [
    {
      'image': 'https://via.placeholder.com/150', // Substitua pela URL real
      'title': 'Phuket - Thailand',
      'subtitle': 'Suvarnabhumi Airport',
    },
    {
      'image': 'https://via.placeholder.com/150', // Substitua pela URL real
      'title': 'Singapore - Singapore',
      'subtitle': 'Hanoi Airport',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Price Monitoring',
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: monitoredFlights.length,
        itemBuilder: (context, index) {
          final flight = monitoredFlights[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // Imagem do voo
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        flight['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Informações do voo
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            flight['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            flight['subtitle']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Ícone de gráfico e botão de detalhes
                    Column(
                      children: [
                        const Icon(Icons.show_chart, size: 30, color: Colors.black),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Ação do botão Detalhes
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0CC0DF),
                            minimumSize: const Size(80, 30),
                          ),
                          child: const Text('Details'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      selectedIndex: 2,
    );
  }
}
