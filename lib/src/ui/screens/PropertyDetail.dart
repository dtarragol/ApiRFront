import 'package:apir_front/src/models/ApartmentModel.dart';
import 'package:apir_front/src/models/PropertyModel.dart';
import 'package:apir_front/src/models/image/ImageModel.dart';
import 'package:apir_front/src/services/api/apartment.dart';
import 'package:apir_front/src/services/api/image.dart';
import 'package:apir_front/src/ui/screens/Home.dart';
import 'package:apir_front/src/ui/themes/app_theme.dart';
import 'package:apir_front/src/ui/widgets/CustomAppBar.dart';
import 'package:apir_front/src/ui/widgets/ImageCasouselCard.dart';
import 'package:apir_front/src/utils/api_constants.dart';
import 'package:flutter/material.dart';

class PropertyDetail extends StatefulWidget {
  final PropertyModel property;

  const PropertyDetail(this.property, {super.key});

  @override
  _PropertyPageState createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyDetail> with TickerProviderStateMixin {
  Object? _propertyDetail;
  List<String>? _propertyImages;
  
  Future<void> _loadProperty() async {
    Object? propertyDetail;
    if(widget.property.idPropertyType == 1) {
      propertyDetail = await ApiApartmentGet.byIdProperty(widget.property.id);
    }else{
      propertyDetail = await ApiApartmentGet.byIdProperty(widget.property.id);
    }
    setState(() {
      _propertyDetail = propertyDetail;
    });
  }

  Future<void> _loadImages() async {
    List<ImageModel> imageList = await ApiImageGet.byIdProperty(widget.property.id);
    setState(() {
      _propertyImages = imageList.map((e) => ApiUrlConstants.baseUrl+e.url).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadProperty();
    _loadImages();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: widget.property.name,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      ),
      body: _propertyDetail == null
          ? Center(child: CircularProgressIndicator())
          : Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                ImageCarouselCard(imageUrls: _propertyImages),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.property.name,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${widget.property.price.toString()} €",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.property.description,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      if(widget.property.idPropertyType == 1)...[
                        Text(
                          "${(_propertyDetail as ApartmentModel).indoorSquareMeters.toString()} m2 (${(_propertyDetail as ApartmentModel).totalSquareMeters.toString()} m2)",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Habitaciones: ${(_propertyDetail as ApartmentModel).bedrooms.toString()}',
                          style: TextStyle(fontSize: 16),
                        ),
                        if((_propertyDetail as ApartmentModel).isAnAtic)
                          Text(
                            'Ático',
                            style: TextStyle(fontSize: 16),
                          ),

                        if((_propertyDetail as ApartmentModel).hasGarage)
                          Text(
                            '- Garaje incluido',
                            style: TextStyle(fontSize: 16),
                          ),

                        if((_propertyDetail as ApartmentModel).hasTerrace)
                          Text(
                            '- Terraza',
                            style: TextStyle(fontSize: 16),
                          ),

                        if((_propertyDetail as ApartmentModel).hasBalcony)
                          Text(
                            '- Balcon',
                            style: TextStyle(fontSize: 16),
                          ),

                        if((_propertyDetail as ApartmentModel).hasGarden)
                          Text(
                            '- Jardin',
                            style: TextStyle(fontSize: 16),
                          ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  ApiUrlConstants.image02, // Reemplaza con la URL de tu imagen
                  fit: BoxFit.cover,
                  width: 56, 
                  height: 56,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error); // Muestra un icono de error si la imagen no se carga
                  },
                ),
              ), // Fondo blanco para el botón
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  backgroundColor: AppTheme.accentColor,
                  onPressed: () {
                    // Acción al presionar el botón +
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 16),
                FloatingActionButton(
                  backgroundColor: AppTheme.secondaryColor,
                  onPressed: () {
                    // Acción al presionar el botón de chat
                  },
                  child: Icon(Icons.chat),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}