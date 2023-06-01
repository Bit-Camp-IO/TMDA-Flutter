import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmda/core/constants/route_constants.dart';
import 'package:tmda/core/util/strings_manager.dart';
import 'package:tmda/features/auth/presentation/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          loading = true;
        } else if (state is AuthenticationState &&
            state.authData.requestSuccess!) {
          Navigator.of(context).pushReplacementNamed(
            movieRoute
          );
        } else if (state is AuthenticationState &&
            !state.authData.requestSuccess!) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.authData.statusMessage!)));
        } else if (state is AuthFailureState) {
          debugPrint('There was a problem');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF19191B),
          appBar: AppBar(
            backgroundColor: const Color(0xFF19191B),
            elevation: 0,
            title: const Text(
              StringsManager.appName,
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: AnimateList(
                  interval: 250.ms,
                  effects: [FadeEffect(duration: 150.ms)],
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      onSaved: (newValue) {
                        if (newValue != null) {
                          username = newValue;
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: StringsManager.loginUserName,
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      obscureText: true,
                      onSaved: (newValue) {
                        if (newValue != null) {
                          password = newValue;
                        }
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          labelText: StringsManager.loginPassword,
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        FormState? loginData = formKey.currentState;
                        if (loginData!.validate()) {
                          loginData.save();
                        }
                        await BlocProvider.of<AuthCubit>(context)
                            .userLogin(username, password);
                      },
                      style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(
                          Size(300, 70),
                        ),
                      ),
                      child: loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(fontSize: 24),
                            ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          StringsManager.noAccount,
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () async {
                            await BlocProvider.of<AuthCubit>(context)
                                .userRegister();
                          },
                          child: const Text(StringsManager.register),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
