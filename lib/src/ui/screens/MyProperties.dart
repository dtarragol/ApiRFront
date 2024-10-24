import 'package:apir_front/src/ui/widgets/CustomCard.dart';
import 'package:flutter/material.dart';

class MyProperties extends StatelessWidget {
  final List<String> properties = [
    'Property 1',
    'Property 2',
    'Property 3',
    // Añade más propiedades según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: properties.isEmpty
          ? Center(child: Text('No properties available'))
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: properties.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomCard(
                    onPressed: () {
                      // Acción al presionar la tarjeta
                    },
                    text: properties[index],
                  ),
                );
              },
            ),
    );
  }
}