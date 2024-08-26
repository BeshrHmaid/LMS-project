import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/features/auth/presentation/views/register_screen.dart';
import 'package:lms/features/auth/presentation/views/signin_screen.dart';
import 'package:lms/features/home/presentation/views/home_view.dart';
import 'package:lms/features/license_renewal/presentation/views/license_renewal.dart';
import 'package:lms/features/payment/presentation/views/payment_view.dart';
import 'package:lms/features/roles_and_premission/data/models/authority.dart';
import 'package:lms/features/roles_and_premission/presentation/views/add_new_role_view.dart';
import 'package:lms/features/roles_and_premission/presentation/views/manage_roles_view.dart';
import 'package:lms/features/roles_and_premission/presentation/views/roles_and_permission_dashboard_view.dart';
import 'package:lms/features/roles_and_premission/presentation/views/update_roles_view.dart';
import 'package:lms/features/roles_and_premission/presentation/views/users_view.dart';

abstract class AppRouter {
  static const kSignIn = '/singIn';
  static const kHomeView = '/homeView';
  static const kPaymentView = '/paymentView';
  static const kLicenseRenewalView = '/licenseRenewalView';
  static const kRolesAndPermissionView = '/rolesAndPermissionView';
  static const kManageRolesView = '/manageRolesView';
  static const kUpdateRoleView = '/updateRoleView';
  static const kAddNewRoleView = '/addNewRoleView';
  static const kRegister = '/';
  static const kUsersView = '/usersView';

  static final router = GoRouter(
    initialLocation: kRegister,
    errorPageBuilder: (context, state) => MaterialPage(child: Container()),
    routes: [
      GoRoute(
        path: kRegister,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: kSignIn,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: kRolesAndPermissionView,
        builder: (context, state) => const RolesAndPermissionDashboardView(),
      ),
      GoRoute(
        path: kAddNewRoleView,
        builder: (context, state) => const AddNewRoleView(),
      ),
      GoRoute(
        path: kUpdateRoleView,
        builder: (context, state) => UpdateRolesView(),
      ),
      GoRoute(
        path: kManageRolesView,
        builder: (context, state) => ManageRolesView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kPaymentView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const PaymentView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kLicenseRenewalView,
        builder: (context, state) => const LicenseRenewal(),
      ),
       GoRoute(
        path: kUsersView,
        builder: (BuildContext context, GoRouterState state) {
          final authority = state.extra as Authority;
          return  UsersView(authority: authority,);
        },
      ),
    ],
  );
}
