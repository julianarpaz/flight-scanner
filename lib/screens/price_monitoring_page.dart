import 'package:flutter/material.dart';
import '../customtoolbar.dart';

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
