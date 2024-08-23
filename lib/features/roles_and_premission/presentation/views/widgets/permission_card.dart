import 'package:flutter/material.dart';

class PermissionCard extends StatelessWidget {
  const PermissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text('permission 1'),
        onTap: () {
          
        },
        subtitle: Text('descirption 1'),
      ),
    );
  }
}
