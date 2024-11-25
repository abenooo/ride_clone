import 'package:flutter/material.dart';

class FavouriteList extends StatelessWidget {
  final List<Map<String, String>> favouriteItems = [
    {
      'title': 'Office',
      'address': 'ኢትዮጵያ ንግድ ባንክ ፊንፈኔ ቅ/ፍ, 2Q73+H75, Gambia St, Addis Ababa'
    },
    {
      'title': 'Home',
      'address': 'Merkato, Dubai tera building, Addis Ababa'
    },
    {
      'title': 'House',
      'address': 'Mehal Gebya Shopping center, 2PJP+HWF, Addis Ababa'
    },
    {
      'title': 'Home',
      'address': 'Jemo, Addis Ababa'
    },
    {
      'title': 'Office',
      'address': 'Jema Building | Meskel Flower | ጀማ ህንጻ | መስቀል ፍላወር, Chirkos 02/03'
    },
    {
      'title': 'House',
      'address': 'ኢትዮጵያ ንግድ ባንክ ፊንፈኔ ቅ/ፍ, 2Q73+H75, Gambia St, Addis Ababa'
    },
    {
      'title': 'House',
      'address': 'Dreamliner Hotel, Gabon St, Addis Ababa 1000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: favouriteItems.length,
        itemBuilder: (context, index) {
          final item = favouriteItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.black),
                title: Text(item['title'] ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item['address'] ?? '',
                    style: TextStyle(color: Colors.grey)),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () {
                    // Handle delete action
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
