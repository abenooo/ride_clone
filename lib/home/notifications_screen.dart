import 'package:flutter/material.dart';
import 'base_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'date': 'Today',
        'items': [
          {'time': '15 min ago', 'highlighted': true},
          {'time': '25 min ago', 'highlighted': false},
          {'time': '25 min ago', 'highlighted': true},
        ]
      },
      {
        'date': 'Yesterday',
        'items': [
          {'time': '15 min ago', 'highlighted': true},
          {'time': '25 min ago', 'highlighted': false},
          {'time': '25 min ago', 'highlighted': false},
          {'time': '15 min ago', 'highlighted': true},
        ]
      },
    ];

    return BaseScreen(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, sectionIndex) {
                final section = notifications[sectionIndex];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                      child: Text(
                        section['date'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    ...List.generate(
                      section['items'].length,
                      (index) => _buildNotificationTile(
                        section['items'][index]['time'],
                        section['items'][index]['highlighted'],
                      ),
                    ),
                  ],
                );
              },
              childCount: notifications.length,
            ),
          ),
        ],
      ),
      currentIndex: 3,
    );
  }

  Widget _buildNotificationTile(String time, bool highlighted) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: highlighted ? const Color(0xFFF0F9F6) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment confirm',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
