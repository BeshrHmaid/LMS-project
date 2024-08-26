import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/utils/app_router.dart';
import 'package:lms/core/utils/assets.dart';
import 'package:lms/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';

class CustomExpandedDrawer extends StatelessWidget {
  final VoidCallback closeDrawer;

  const CustomExpandedDrawer({super.key, required this.closeDrawer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.home_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Home'),
                    ],
                  ),
                  onTap: () {
                    // Navigate to Home
                  },
                ),
                ExpansionTile(
                  title: const Row(
                    children: [
                      Icon(Icons.person_outline_sharp),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Users'),
                    ],
                  ),
                  children: <Widget>[
                    ListTile(
                      title: const Text('Sub Item 1'),
                      onTap: () {
                        // Navigate to Sub Item 1
                      },
                    ),
                    ListTile(
                      title: const Text('Sub Item 2'),
                      onTap: () {
                        // Navigate to Sub Item 2
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Row(
                    children: [
                      Icon(Icons.groups_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Teams & Groups'),
                    ],
                  ),
                  children: <Widget>[
                    ListTile(
                      title: const Text('Sub Item 1'),
                      onTap: () {
                        // Navigate to Sub Item 1
                      },
                    ),
                    ListTile(
                      title: const Text('Sub Item 2'),
                      onTap: () {
                        // Navigate to Sub Item 2
                      },
                    ),
                  ],
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.work_outline),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Market Place'),
                    ],
                  ),
                  onTap: () {
                    // Navigate to Market Place
                  },
                ),
                ExpansionTile(
                  title: const Row(
                    children: [
                      Icon(FontAwesomeIcons.creditCard),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Billing'),
                    ],
                  ),
                  children: <Widget>[
                    ListTile(
                      title: const Text('Sub Item 1'),
                      onTap: () {
                        // Navigate to Sub Item 1
                      },
                    ),
                    ListTile(
                      title: const Text('Sub Item 2'),
                      onTap: () {
                        // Navigate to Sub Item 2
                      },
                    ),
                  ],
                ),
                ListTile(
                  title: Row(
                    children: [
                      Image.asset(
                        AssetsData.copilotIcon,
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('Copilot'),
                    ],
                  ),
                  onTap: () {
                    // Navigate to Copilot
                  },
                ),
                userRole.contains('ROLE_ADMIN') 
                    ? ListTile(
                        title: Row(
                          children: [
                            Image.asset(
                              AssetsData.rolesIcon,
                              height: 30,
                              width: 30,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('Roles and permissions'),
                          ],
                        ),
                        onTap: () {
                          GoRouter.of(context)
                              .push(AppRouter.kRolesAndPermissionView);
                        },
                      )
                    : Container(),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(FontAwesomeIcons.wrench),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Setup'),
                    ],
                  ),
                  onTap: () {
                    // Navigate to Setup
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(FontAwesomeIcons.ellipsis),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Show all items'),
                    ],
                  ),
                  onTap: () {
                    // Show all items
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCollapsedDrawer extends StatelessWidget {
  final VoidCallback closeDrawer;

  const CustomCollapsedDrawer({super.key, required this.closeDrawer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: const Icon(Icons.home_outlined),
                  onTap: () {},
                ),
                ListTile(
                  title: const Icon(Icons.person_outline_sharp),
                  onTap: () {
                    // Navigate to Sub Item 1
                  },
                ),
                ListTile(
                  title: const Icon(Icons.groups_outlined),
                  onTap: () {
                    // Navigate to Sub Item 2
                  },
                ),
                ListTile(
                  title: const Icon(Icons.work_outline),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kLicenseRenewalView);
                  },
                ),
                ListTile(
                  title: const Icon(FontAwesomeIcons.creditCard),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kPaymentView);
                  },
                ),
                ListTile(
                  title: Image.asset(
                    AssetsData.copilotIcon,
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    // Navigate to Market Place
                  },
                ),
                userRole.contains('ROLE_ADMIN') 
                    ? ListTile(
                        title: Image.asset(AssetsData.rolesIcon),
                        onTap: () {
                          // Navigate to Copilot
                        },
                      )
                    : Container(),
                ListTile(
                  title: const Icon(FontAwesomeIcons.wrench),
                  onTap: () {
                    // Navigate to Copilot
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Icon(FontAwesomeIcons.ellipsis),
                  onTap: () {
                    // Show all items
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
