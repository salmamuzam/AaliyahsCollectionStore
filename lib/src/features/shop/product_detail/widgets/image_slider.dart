import 'package:flutter/material.dart';

class DetailImageSlider extends StatelessWidget {
  final String image;
  final Function(int)? onChange;

  const DetailImageSlider({
    super.key,
    required this.image,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: image.length,
        onPageChanged: onChange,
        itemBuilder: (context, index) {
          return Image.asset(
              image,
            
          );
        },
      ),
    );
  }
}
