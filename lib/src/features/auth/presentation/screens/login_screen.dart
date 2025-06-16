import 'package:flutter/material.dart';
import 'package:nammkart/src/features/auth/presentation/provider/user_provider.dart';
import 'package:nammkart/src/features/auth/presentation/screens/signup_screen.dart';
import 'package:nammkart/src/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:nammkart/src/config/common/custom_button.dart';
import 'package:nammkart/src/features/home/presentation/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Welcome Back 👋',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()));
                        },
                        child: Text('Forgot Password?',style: TextStyle(color: Colors.deepPurple),),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(title: 'Login', onPress: () async{
                  try{
                    final userProvider = Provider.of<UserProvider>(context,listen: false);
                    final Map<String, dynamic> signupData = {
                      'email': emailController.text.trim(),
                      'password': passwordController.text.trim(),
                    };
                    await userProvider.userLogin(signupData);
                    if(userProvider.authenticate.isNotEmpty){
                      if (!context.mounted) return;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SplashScreen()));
                    }
                  }
                  catch(error)
                  {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.toString())),
                    );
                  }

                }),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()));
                  },
                  child: const Text("Don't have an account? Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
