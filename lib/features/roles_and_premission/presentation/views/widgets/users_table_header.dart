import 'package:flutter/material.dart';

class UsersTableHeader extends StatelessWidget {
  const UsersTableHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[50],
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: const Row(
        children: [
          Expanded(
              flex: 2,
              child:
                  Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              child:
                  Text('Role', style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
              child: Text('Joined on',
                  style: TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
