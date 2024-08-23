import 'package:flutter/material.dart';
import 'package:lms/features/roles_and_premission/data/models/authority.dart';
import 'package:lms/features/roles_and_premission/presentation/views/roles_and_permission_dashboard_view.dart';
import 'package:lms/features/roles_and_premission/presentation/views/widgets/actions_container.dart';

class UpdateRolesViewBody extends StatelessWidget {
  const UpdateRolesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.only(left: 36.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoleNameDropdown(
              title: 'select role',
              authorities: authorities,
            ),
           const SizedBox(height: 16.0),
          const  Text(
              'Permissions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          const  SizedBox(height: 16.0),
         const   PermissionDropdown(
              title: 'Manage Organization',
            ),
           const PermissionDropdown(
              title: 'Manage Developer Settings',
            ),
           const PermissionDropdown(
              title: 'Manage Counterparties',
            ),
           const PermissionDropdown(
              title: 'Manage External Accounts',
            ),
           const PermissionDropdown(
              title: 'Manage API Keys',
            ),
        const    PermissionDropdown(
              title: 'Manage Ledgers',
            ),
            const SizedBox(
              height: 30,
            ),
          const  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 110,
                    child: ActionsContainer(
                      containerBgColor: Colors.green,
                      containerIcon: Icon(Icons.save),
                      containerText: 'save',
                      txtColor: Colors.white,
                    )),
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                    width: 110,
                    child: ActionsContainer(
                      containerBgColor: Colors.red,
                      containerIcon: Icon(Icons.cancel),
                      containerText: 'cancel',
                      txtColor: Colors.white,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PermissionDropdown extends StatefulWidget {
  final String title;

  const PermissionDropdown({super.key, required this.title});

  @override
  _PermissionDropdownState createState() => _PermissionDropdownState();
}

class _PermissionDropdownState extends State<PermissionDropdown> {
  String _selectedPermission = 'No Access';
  final List<String> _permissions = [
    'No Access',
    'View Only Access',
    'Manage and Edit Access'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 200, // Adjust this width as needed
            child: Text(widget.title),
          ),
          const SizedBox(width: 16.0),
          SizedBox(
            width: 300,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedPermission,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPermission = newValue!;
                });
              },
              items: _permissions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class RoleNameDropdown extends StatefulWidget {
  final List<Authority> authorities;
  final String title;

  const RoleNameDropdown({super.key, required this.authorities, required this.title});

  @override
  _RoleNameDropdownState createState() => _RoleNameDropdownState();
}

class _RoleNameDropdownState extends State<RoleNameDropdown> {
  late String _selectedRole;

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.authorities[0].authority ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 200, // Adjust this width as needed
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 16.0),
          SizedBox(
            width: 300,
            child: DropdownButton<String>(
              isExpanded: true,
              value: _selectedRole,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRole = newValue!;
                });
              },
              items: widget.authorities.map<DropdownMenuItem<String>>((Authority value) {
                return DropdownMenuItem<String>(
                  value: value.authority,
                  child: Text(value.authority ?? ''),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
