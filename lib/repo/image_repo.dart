import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application/entities/imageEntity.dart';

class ImageRepository {
  Future<List<PixelFordImage>> getNetworkImages() async {
    Uri url = Uri.parse('https://pixelford.com/api/2/images');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> decodedList = jsonDecode(response.body) as List;
      final List<PixelFordImage> imageList = decodedList.map((e) {
        return PixelFordImage.fromJson(e);
      }).toList();

      return imageList;
    } else {
      throw 'API call not successful';
    }
  }
}