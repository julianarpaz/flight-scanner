import 'package:flutter/material.dart';
import '../customtoolbar.dart';

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
