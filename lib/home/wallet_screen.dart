import 'package:flutter/material.dart';
import 'base_screen.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      currentIndex: 0, // Assuming CarScreen is the first icon in the nav bar
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add Money'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: _buildBalanceCard(
                    '\$500',
                    'Available Balance',
                    const Color(0xFFE8F5F0),
                  ),
                ),
                Expanded(
                  child: _buildBalanceCard(
                    '\$200',
                    'Total Expend',
                    const Color(0xFFE8F5F0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildTransactionItem('Welton', '09:20 am', -570.00),
                _buildTransactionItem('Nathsam', '09:20 am', 570.00),
                _buildTransactionItem('Welton', '09:20 am', -570.00),
                _buildTransactionItem('Nathsam', '09:20 am', 570.00),
                _buildTransactionItem('Nathsam', '09:20 am', 570.00),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(String amount, String title, Color color) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            amount,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String name, String time, double amount) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: amount > 0 ? Colors.green[100] : Colors.red[100],
        child: Icon(
          Icons.arrow_forward,
          color: amount > 0 ? Colors.green : Colors.red,
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('Today at $time'),
      trailing: Text(
        '${amount > 0 ? '+' : ''}\$${amount.abs()}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: amount > 0 ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
