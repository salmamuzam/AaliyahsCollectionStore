import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(padding: EdgeInsets.all(15)),
            onPressed: () {},

            icon: Icon(Icons.arrow_back),
          ),
          SizedBox(width: 10),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(padding: EdgeInsets.all(15)),
            onPressed: () {},

            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
