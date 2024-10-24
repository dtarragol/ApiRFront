import 'package:apir_front/src/ui/screens/MiProperties.dart';
import 'package:flutter/material.dart';
import 'package:apir_front/src/ui/themes/app_theme.dart';
import 'package:apir_front/src/ui/widgets/CustomAppBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    ProfileScreen(),
    SettingsScreen(),
    SettingsScreen(),
  ];

  static const List<String> _appBarTitles = <String>[
    'Buscar propiedades',
    'Mis propiedades',
    'Mi perfil',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: _appBarTitles[_selectedIndex],
        onPressed: () {
          // Acción al presionar el icono
        },
        icon: Icon(
          Icons.settings,
          color: AppTheme.backgroundColorLight,
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Mis publicaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.primaryColor, 
        onTap: _onItemTapped,
      ),
    );
  }
}
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Dashboard Screen'),
    );
  }
}
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}