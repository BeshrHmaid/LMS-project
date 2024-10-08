import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/core/functions/show_snack_bar.dart';
import 'package:lms/core/utils/app_router.dart';
import 'package:lms/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>(); // GlobalKey for the form

  SignInForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          showSnackBar(context, 'Sign-in successful', Colors.green);
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is SignInFailure) {
          showSnackBar(context, state.error, Colors.red);
        }
      },
      child: Form(
        key: _formKey, // Assign the key to the Form
        child: Column(
          children: [
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              obscureText: true,
            ),
            BlocBuilder<SignInCubit, SignInState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Validate the form
                      context.read<SignInCubit>().signIn(
                            username: usernameController.text,
                            password: passwordController.text,
                          );
                    }
                  },
                  child: state is SignInLoading
                      ? const CircularProgressIndicator()
                      : const Text('Sign In'),
                );
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: const Text("Forgot Password?",
                  style: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 10),
            const SignInAlternative(),
          ],
        ),
      ),
    );
  }
}

class SignInAlternative extends StatelessWidget {
  const SignInAlternative({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text("Don't have an account?"),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kRegister);
          },
          child: const Text("Register", style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
