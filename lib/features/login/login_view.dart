import 'package:aluminex_client/features/login/cubit/login_cubit.dart';
import 'package:aluminex_client/features/login/cubit/login_cubit_states.dart';
import 'package:aluminex_client/features/login/widgets/divider_widget.dart';
import 'package:aluminex_client/features/login/widgets/login_welcome_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validatorless/validatorless.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final loginCubit = LoginCubit();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<LoginCubit, LoginCubitState>(
          bloc: loginCubit,
          builder: (context, state) {
            if (state is LoginLoggedState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, '/home');
              });
            }

            if (state is LoginErrorState) {
              return Center(
                child: Text(state.message),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),
                      const LoginWelcomeBanner(),
                      const SizedBox(height: 40),
                      Text(
                        'Faça o login na sua conta',
                        style: GoogleFonts.robotoSlab(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.email('Email inválido!'),
                          Validatorless.required('Email não pode ser vazio!'),
                        ]),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          label: const Text('Digite o seu email'),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: passwordEC,
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.min(14, 'Senha deve conter 14 caracteres'),
                          Validatorless.required('Senha não pode ser vazio!'),
                        ]),
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          label: const Text('Digite a sua senha'),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          backgroundColor: const Color.fromRGBO(245, 55, 69, 1),
                        ),
                        onPressed: () {
                          final valid = formKey.currentState?.validate() ?? false;

                          if (valid) {
                            loginCubit.loginUser(
                              email: emailEC.text,
                              password: passwordEC.text,
                            );
                          }
                        },
                        child: state is LoginLoadingState
                            ? const CircularProgressIndicator()
                            : const Text(
                                'Login',
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              ),
                      ),
                      const SizedBox(height: 20),
                      const DividerWidget(),
                      const SizedBox(height: 16),
                      Text(
                        'Ainda não possui uma conta?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoSlab(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          minimumSize: const Size.fromHeight(48),
                        ),
                        child: const Text(
                          'Entre em contato conosco aqui',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
