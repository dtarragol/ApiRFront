import 'package:apir_front/src/services/api/login.dart';
import 'package:apir_front/src/ui/screens/Home.dart';
import 'package:apir_front/src/ui/screens/Register.dart';
import 'package:apir_front/src/ui/themes/app_theme.dart';
import 'package:apir_front/src/ui/widgets/CustomAppBar.dart';
import 'package:apir_front/src/ui/widgets/CustomCancelElevatedButton.dart';
import 'package:apir_front/src/ui/widgets/CustomCenterTextField.dart';
import 'package:apir_front/src/ui/widgets/CustomElevatedButton%20copy.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<double> _fadeAnimation1;
  late Animation<double> _fadeAnimation2;
  bool? _isLoggedIn;

  Future<void> _checkLoginStatus() async {
    var isLoggedIn = await ApiGetLogin.checkLoginStatus();
    setState(() {
      _isLoggedIn = isLoggedIn;
    });

    if (_isLoggedIn == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    _animationController1 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animationController2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation1 = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController1,
      curve: Curves.easeInOut,
    ));

    _animation2 = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _animationController2,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController1,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController2,
      curve: Curves.easeInOut,
    ));

    _animationController1.forward();
    _animationController2.forward();
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    final response = await ApiLoginPost.login(context, email, password);

    if (response.succes) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }

  void _register() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Login',
        onPressed: () {
          // TODO
        },
        icon: Icon(
          Icons.settings,
          color: AppTheme.backgroundColorLight,
        ),
      ),
      body: Center(
        child: _isLoggedIn == null ? CircularProgressIndicator()
        : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 300, 
                width: double.infinity, 
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SlideTransition(
                      position: _animation1,
                      child: FadeTransition(
                        opacity: _fadeAnimation1,
                        child: SizedBox(
                          height: 300,
                          width: 300, 
                          child: Image.asset(
                            'assets/images/logogreen1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _animation2,
                      child: FadeTransition(
                        opacity: _fadeAnimation2,
                        child: SizedBox(
                          height: 300,
                          width: 300, 
                          child: Image.asset(
                            'assets/images/logogreen2.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300, 
                child: CustomCenterTextField(
                  text: 'Email',
                  controller: _emailController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300, 
                child: CustomCenterTextField(
                  text: 'Password',
                  controller: _passwordController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 280,
                child: CustomElevatedButton(
                  text: 'Iniciar sesión',
                  onPressed: _login,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 280, 
                child: CustomCancelElevatedButton(
                  text: 'Registrarse',
                  onPressed: _register,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 280, 
                child: TextButton(
                  onPressed: () {
                    // TODO
                  },
                  child: Text(
                    '¿Has olvidado tu contraseña?',
                    style: TextStyle(
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}