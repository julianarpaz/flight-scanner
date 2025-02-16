import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLoggedIn = false; // Estado para verificar login
  String userName = "Guest";
  String userEmail = "guest@example.com";

  @override
  void initState() {
    super.initState();
    checkLoginStatus(); // Verifica o status de login ao iniciar a página
  }

  // Simula a verificação de login (substitua por Firebase/Auth)
  void checkLoginStatus() {
    // Aqui você pode substituir por uma verificação real de autenticação
    bool userLoggedIn = true; // Substituir por uma checagem real

    setState(() {
      isLoggedIn = userLoggedIn;
      if (isLoggedIn) {
        userName = "Jane Doe";
        userEmail = "jane.doe@gmail.com";
      } else {
        userName = "Guest";
        userEmail = "guest@example.com";
      }
    });
  }

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
                      if (isLoggedIn)
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
                  Text(
                    userName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    userEmail,
                    style: const TextStyle(color: Colors.grey),
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
            if (isLoggedIn) ...[
              buildListTile(
                icon: Icons.key,
                title: 'Change Password',
                onTap: () {},
              ),
            ],
            buildListTile(
              icon: Icons.language,
              title: 'Language',
              onTap: () {},
            ),
            // Information Section
            buildSectionTitle('Information'),
            if (isLoggedIn)
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
              icon: isLoggedIn ? Icons.logout : Icons.login,
              title: isLoggedIn ? 'Sign out' : 'Sign in',
              onTap: () {
                setState(() {
                  isLoggedIn = !isLoggedIn;
                  if (!isLoggedIn) {
                    userName = "Guest";
                    userEmail = "guest@example.com";
                  } else {
                    userName = "Jane Doe";
                    userEmail = "jane.doe@gmail.com";
                  }
                });
              },
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
