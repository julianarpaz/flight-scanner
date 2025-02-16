import 'package:flutter/material.dart';
import '../customtoolbar.dart';

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