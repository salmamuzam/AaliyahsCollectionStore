import 'package:aaliyahs_collection_estore/data/data.dart';
import 'package:aaliyahs_collection_estore/models/category.dart';
import 'package:aaliyahs_collection_estore/src/constants/image_strings.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:aaliyahs_collection_estore/src/features/shop/home/widgets/category_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.02,
          vertical: MediaQuery.sizeOf(context).height * 0.01,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBar(context),
            _title(context),
            _categoriesList(context),
          ],
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(AaliyahProfileImage),
          ),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AaliyahTextSpan,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextSpan(
            text: AaliyahTextSpan2,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  Widget _categoriesList(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.05,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.01,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: CategoryButton(category: category, isSelected: index == 0),
          );
        },
      ),
    );
  }
}
