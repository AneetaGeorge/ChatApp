import 'package:flutter/material.dart';
import 'package:flutter_application/entities/imageEntity.dart';
import 'package:flutter_application/repo/image_repo.dart';

class NetworkImagePicker extends StatelessWidget {
  final Function(String) onImageSelected;
  const NetworkImagePicker({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    final ImageRepository imageRepo = ImageRepository();

    return Container(
      padding: EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24)
        )
      ),
      child: FutureBuilder<List<PixelFordImage>>(
          future: imageRepo.getNetworkImages(),
          builder: (BuildContext context, AsyncSnapshot<List<PixelFordImage>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 0.5,
                      crossAxisSpacing: 5,
                      maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          onImageSelected(snapshot.data![index].urlSmallSize);
                        },
                        child: Image.network(snapshot.data![index].urlSmallSize));
                  }
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: CircularProgressIndicator()
                ),
              );
            }
          }
      ),
    );
  }
}
