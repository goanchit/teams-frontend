import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopper/api/supabase.dart';
import 'package:shopper/constants/constants.dart';
import 'package:shopper/repository/auth.dart';
import 'package:shopper/store/auth/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<String?> errorNotifier = ValueNotifier(null);
  final ValueNotifier<bool> isSignupFlow = ValueNotifier(false);
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  late final SupabaseLayer sbase;
  late final AuthenticationRepository _authRepo;

  @override
  void initState() {
    super.initState();
    sbase = SupabaseLayer();
    _authRepo = AuthenticationRepository(sbase);
  }

  @override
  void dispose() {
    super.dispose();
    errorNotifier.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    emailController.addListener(() {
      final email = emailController.text;
      errorNotifier.value = isValidEmail(email) ? null : 'Invalid email';
    });

    return BlocProvider(
        create: (context) => AuthBloc(_authRepo),
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 80),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7 - 80,
                    child: Center(
                        child: SvgPicture.asset(
                      logoSvg,
                      height: 200,
                      width: 200,
                    ))),
                SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ValueListenableBuilder(
                              valueListenable: isSignupFlow,
                              builder: (context, flow, _) {
                                return InkWell(
                                  onTap: () {
                                    isSignupFlow.value = !flow;
                                  },
                                  child: Text(
                                    flow
                                        ? "Don't have an account?"
                                        : "Already have an account?",
                                    style: const TextStyle(color: Colors.blue),
                                    textAlign: TextAlign.end,
                                  ),
                                );
                              })),
                      ValueListenableBuilder(
                          valueListenable: errorNotifier,
                          builder: (context, errText, _) {
                            return TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: const UnderlineInputBorder(),
                                errorText: errText,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              // textInputAction: TextInputAction.next,
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: UnderlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) async {
                          if (state is AuthSuccess) {
                            await storage.write(key: accessToken, value: state.token);
                            if (context.mounted) {
                              context.go("/home");
                            }
                            return ;
                          }
                          if (state is AuthFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login failed: ${state.error}')),
                            );
                          }
                        },
                        child: BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (state is AuthLoading) {
                                return const CircularProgressIndicator();
                              }
                              return InkWell(
                                onTap: () {
                                  final password = passwordController.text;
                                  final email = emailController.text;
                                  context.read<AuthBloc>().add(AuthenticateUser(email, password, isSignupFlow.value));
                                },
                                child: SvgPicture.asset(
                                  rightArrow,
                                  height: 30,
                                  width: 30,
                                ),
                              );
                            }
                          ),
                      ),
                    ],
                  ),
                ),
              ]),
        )));
  }
}

bool isValidEmail(String email) {
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return regex.hasMatch(email);
}
