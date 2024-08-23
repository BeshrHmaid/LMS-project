// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lms/features/roles_and_premission/presentation/views/widgets/pop_up_menu_actions_button.dart';
import 'package:lms/features/roles_and_premission/presentation/views/widgets/users_table_filtering_row.dart';
import 'package:lms/features/roles_and_premission/presentation/views/widgets/users_table_header.dart';

class User {
  final String name ;
  final String email;
  final String role;
  final String status;
  final String invitedDate;
  final int daysToExpire;
  User({
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.invitedDate,
    required this.daysToExpire,
  });
}


class RolesAndPermissionDashboardViewBody extends StatefulWidget {
  const RolesAndPermissionDashboardViewBody({super.key});

  @override
  State<RolesAndPermissionDashboardViewBody> createState() =>
      _RolesAndPermissionDashboardViewBodyState();
}

class _RolesAndPermissionDashboardViewBodyState
    extends State<RolesAndPermissionDashboardViewBody> {
  // Define the users list as a state variable
  List<User> users = [
    User(
      name: 'u1',
      email: 'u1@emailaddressdomain.com',
      role: 'role1',
      status: 'PENDING',
      invitedDate: 'Jul 4, 2022',
      daysToExpire: 29,
    ),
    User(
      name: 'u2',
      email: 'u2@emailaddressdomain.com',
      role: 'role2',
      status: 'PENDING',
      invitedDate: 'Jul 4, 2022',
      daysToExpire: 29,
    ),
  ];

  // Method to remove a user from the list
  void _removeUser(User user) {
    setState(() {
      users.remove(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Filters Row
          const UsersTableFilteringRow(),
          // Data Row
          const UsersTableHeader(),
          // List of Users
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: users.length,
            itemBuilder: (context, index) {
              User user = users[index];
              return displayUserRow(user);
            },
          ),
        ],
      ),
    );
  }

  Container displayUserRow(User user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: displayUserName(user),
          ),
          Expanded(child: Text(user.role)),
          Expanded(
            child: displayJoiningInformation(user),
          ),
          PopUpMenuActionsButton(
            onSelected: (value) {
              if (value == 'Remove') {
                _removeUser(user); // Remove the selected user
              }
            },
          ),
        ],
      ),
    );
  }

  Column displayJoiningInformation(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Invited: ${user.invitedDate}'),
        Text('Expires in ${user.daysToExpire} days'),
      ],
    );
  }

  Row displayUserName(User user) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue[100],
          radius: 20,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(user.email),
          ],
        ),
      ],
    );
  }
}
