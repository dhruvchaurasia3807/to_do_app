import 'package:flutter/material.dart';
import 'package:todo_list_flutter_app/contants/colors.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() =>_loginScreenState();
}

class _loginScreenState extends State<LoginScreen>{
  final _emailController =   TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = true;
  bool _isLogin = true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.check_circle_outline,size: 80,color: AppColors.primary),
          SizedBox(height: 32),
          Text(_isLogin ? 'Welcome Back' : 'Create Account',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
          ),
          ),

          SizedBox(height: 8),

          Text(
            _isLogin
               ? 'Sign in to continue managing your tasks'
               : 'Join us and start organizing your life',
               textAlign: TextAlign.center,
               style: TextStyle(fontSize: 16,
               color: AppColors.textSecondary,
          ),
          ), 
        ],
      ),
    );
  }
}