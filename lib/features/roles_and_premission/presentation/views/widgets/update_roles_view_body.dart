import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/functions/show_snack_bar.dart';
import 'package:lms/features/roles_and_premission/data/models/authority.dart';
import 'package:lms/features/roles_and_premission/presentation/manager/permission_cubit/permission_cubit.dart';
import 'package:lms/features/roles_and_premission/presentation/views/roles_and_permission_dashboard_view.dart';
import 'package:lms/features/roles_and_premission/presentation/views/widgets/actions_container.dart';
import 'package:lms/features/roles_and_premission/presentation/views/widgets/permission_card.dart';

class UpdateRolesViewBody extends StatelessWidget {
  const UpdateRolesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionCubit, PermissionState>(
      listener: (context, state) {
        if (state is GetPermissionStateSuccess) {
          permissions = state.permissions;
        } else if (state is PermissionStateFailure) {
          showSnackBar(context, state.errorMessage, Colors.red);
        }
      },
      child: BlocBuilder<PermissionCubit, PermissionState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RoleNameDropdown(
                  title: 'Select Role',
                  authorities: authorities,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Permissions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: state is PermissionStateLoading
                      ? const Center(child: CircularProgressIndicator())
                      : permissions.isNotEmpty? ListView.builder(
                          itemCount: permissions.length,
                          itemBuilder: (context, index) {
                            return PermissionCard(
                              title: permissions[index].permission ?? '',
                              subTitle: permissions[index]
                                  .permissionDescription ?? '',
                            
                            );
                          },
                        ):const Center(child: Text('No Permissions were assigned to this role!'),)
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 110,
                        child: ActionsContainer(
                          containerBgColor: Colors.green,
                          containerIcon: Icon(Icons.save),
                          containerText: 'Save',
                          txtColor: Colors.white,
                        )),
                    SizedBox(width: 30),
                    SizedBox(
                        width: 110,
                        child: ActionsContainer(
                          containerBgColor: Colors.red,
                          containerIcon: Icon(Icons.cancel),
                          containerText: 'Cancel',
                          txtColor: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RoleNameDropdown extends StatefulWidget {
  final List<Authority> authorities;
  final String title;

  const RoleNameDropdown({
    super.key,
    required this.authorities,
    required this.title,
  });

  @override
  _RoleNameDropdownState createState() => _RoleNameDropdownState();
}

class _RoleNameDropdownState extends State<RoleNameDropdown> {
  late String selectedRole;

  @override
  void initState() {
    super.initState();
    selectedRole = widget.authorities[0].authority ?? '';
    
    // Call getPermissions after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PermissionCubit>().getPermissions(roleName: selectedRole);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 200,
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
              value: selectedRole,
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue!;
                });
                // Trigger the getPermissions function with the updated role name
                context.read<PermissionCubit>().getPermissions(roleName: selectedRole);
              },
              items: widget.authorities
                  .map<DropdownMenuItem<String>>((Authority value) {
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
