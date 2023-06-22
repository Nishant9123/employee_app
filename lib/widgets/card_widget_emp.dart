import 'package:flutter/material.dart';

class CardWidgetEmployee extends StatelessWidget {
  const CardWidgetEmployee(
      {super.key, required this.data, required this.title, required this.icon});

  final String data;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black54),
        ),
        subtitle: Text(data),
      ),
    );
  }
}
