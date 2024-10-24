import 'package:apir_front/src/utils/api_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarouselCard extends StatefulWidget {
  final List<String>? imageUrls;

  const ImageCarouselCard({this.imageUrls});

  @override
  _ImageCarouselCard createState() => _ImageCarouselCard();
}

class _ImageCarouselCard extends State<ImageCarouselCard> {
  List<String>? _imageUrls;

  @override
  void initState() {
    super.initState();
    setState(() {
      _imageUrls = widget.imageUrls ?? [ApiUrlConstants.image01, ApiUrlConstants.image02];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400.0, 
            autoPlay: true,
            enlargeCenterPage: true,  
            aspectRatio: 16/9, 
            autoPlayInterval: Duration(seconds: 3), 
          ),
          items: _imageUrls!.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      );
    }
  }


