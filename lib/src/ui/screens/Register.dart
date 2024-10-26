import 'package:apir_front/src/models/NewUserModel.dart';
import 'package:apir_front/src/services/api/login.dart';
import 'package:apir_front/src/services/api/user.dart';
import 'package:apir_front/src/ui/screens/Home.dart';
import 'package:apir_front/src/ui/themes/app_theme.dart';
import 'package:apir_front/src/ui/widgets/CustomAppBar.dart';
import 'package:apir_front/src/ui/widgets/CustomCenterTextField.dart';
import 'package:apir_front/src/ui/widgets/CustomElevatedButton%20copy.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with TickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() async {
    String name = _nameController.text;
    String surname = _surnameController.text;
    String phoneNumber = _phoneNumberController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    var user = NewUserModel(
      name: name, 
      surname: surname, 
      phoneNumber: phoneNumber, 
      email: email, 
      password: password
    );

    try{
      await ApiUserPost.postUserData(user.toJson());
      await ApiLoginPost.login(context, email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fallo en el registro')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Register',
        onPressed: () {
          // Acción al presionar el icono
        },
        icon: Icon(
          Icons.settings,
          color: AppTheme.backgroundColorLight,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300, // Ajusta el ancho según sea necesario
                child: CustomCenterTextField(
                  text: 'Name',
                  controller: _nameController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300, // Ajusta el ancho según sea necesario
                child: CustomCenterTextField(
                  text: 'Surname',
                  controller: _surnameController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300, // Ajusta el ancho según sea necesario
                child: CustomCenterTextField(
                  text: 'Phone Number',
                  controller: _phoneNumberController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300, // Ajusta el ancho según sea necesario
                child: CustomCenterTextField(
                  text: 'Email',
                  controller: _emailController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300, // Ajusta el ancho según sea necesario
                child: CustomCenterTextField(
                  text: 'Password',
                  controller: _passwordController,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 280, // Ajusta el ancho para que sea un poco menos que los TextFields
                child: CustomElevatedButton(
                  text: 'Register',
                  onPressed: _register,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}