import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Aaliyah's Collection",
          style: TextStyle(
            fontSize: 24, // Adjust this to your desired font size
            fontWeight:
                FontWeight.bold, // Optional: makes the text bold
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(padding: EdgeInsets.all(20)),
          onPressed: () {},
          iconSize: 30,
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
