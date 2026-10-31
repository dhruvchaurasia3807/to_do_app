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
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
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
              SizedBox(height: 48),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(controller: _emailController,
                    decoration: InputDecoration(labelText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) => value != null && value.contains('@')
                        ? null
                        : 'Enter valid email',
                    ),
                
                    SizedBox(height: 16),
                TextFormField(controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: (value) => value != null && value.length >= 6
                    ? null
                    : 'Password must be at least 6 characters',
                ),
                
                 
                  ],
                ),
              ),

              SizedBox(height: 32),
              ElevatedButton(onPressed: (){}, child: Text(_isLogin ? "Login" : "Signup",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
              ),  

              SizedBox(height: 24),    
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_isLogin
                           ? ' Don\'t have an account? ' 
                           : 'Already have an account? ',
                           style: TextStyle(color: AppColors.textSecondary),
                           ),

                           TextButton(
                            onPressed: (){
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin ? "Signup" : "Login",
                           style: TextStyle(fontWeight: FontWeight.bold),
                           ),
                           style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                           ),
                           ),
                ],
              ) 
              
            ],
          ),
        ),
      ),
    );
  }
}