import 'package:flutter/material.dart';

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
