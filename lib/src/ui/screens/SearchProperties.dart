import 'package:apir_front/src/ui/widgets/CustomSearchAppBar.dart';
import 'package:flutter/material.dart';

class SearchProperties extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchProperties> {
  String _searchQuery = '';

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _onFilterPressed() {
    // Acción al presionar el botón de filtro
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSearchAppBar(
        hintText: 'Buscar...',
        onSearchChanged: _onSearchChanged,
        onFilterPressed: _onFilterPressed,
      ),
      body: Center(
        child: Text('Search query: $_searchQuery'),
      ),
    );
  }
}