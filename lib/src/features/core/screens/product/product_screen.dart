import 'package:aaliyahs_collection_estore/bottom_nav.dart';
import 'package:aaliyahs_collection_estore/repository/category_repository.dart';
import 'package:aaliyahs_collection_estore/repository/product_repository.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:aaliyahs_collection_estore/src/features/core/models/category.dart';
import 'package:aaliyahs_collection_estore/src/features/core/models/product.dart';
import 'package:aaliyahs_collection_estore/src/features/core/screens/product_detail/product_detail_screen.dart';
import 'package:aaliyahs_collection_estore/src/features/core/screens/home/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String? initialCategory;

  const ProductScreen({super.key, this.initialCategory});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int isSelected = 0;
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    // Set initial category based on parameter or default to first category
    final initialCategoryName = widget.initialCategory ?? categories[0].name;
    _setInitialCategory(initialCategoryName);
    _filterProducts(initialCategoryName);
  }

  void _setInitialCategory(String categoryName) {
    final index = categories.indexWhere((category) => category.name == categoryName);
    if (index != -1) {
      setState(() {
        isSelected = index;
      });
    }
  }

  void _filterProducts(String categoryName) {
    setState(() {
      if (categoryName == "All") {
        filteredProducts = products;
      } else {
        filteredProducts = getProductsByCategory(categoryName);
      }
    });
  }

  void _onCategoryTap(int index, String categoryName) {
    setState(() {
      isSelected = index;
    });
    _filterProducts(categoryName);
  }

  void _onProductTap(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
          ),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          AaliyahProductText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(
        children: [
          // Categories Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: LayoutBuilder(
              builder: (context, constraints) {
                double buttonWidth = constraints.maxWidth / categories.length - 8;

                return Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(categories.length, (index) {
                    final Category category = categories[index];
                    return SizedBox(
                      width: buttonWidth,
                      child: _buildProductCategory(
                        index: index,
                        name: category.name,
                        onTap: () => _onCategoryTap(index, category.name),
                      ),
                    );
                  }),
                );
              },
            ),
          ),

          // Products Grid Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _productsGrid(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCategory({
    required int index,
    required String name,
    required VoidCallback onTap,
  }) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final bool selected = isSelected == index;

    final Color backgroundColor = isDarkMode
        ? (selected ? AaliyahLightColor : AaliyahSecondaryColor)
        : (selected ? AaliyahDarkColor : AaliyahPrimaryColor);

    final Color textColor = isDarkMode
        ? (selected ? AaliyahDarkColor : AaliyahDarkColor)
        : (selected ? AaliyahLightColor : AaliyahLightColor);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          name,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _productsGrid(BuildContext context) {
    if (filteredProducts.isEmpty) {
      return Center(
        child: Text(
          "No products found in this category",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;

        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: false,
          itemCount: filteredProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.75,
            mainAxisSpacing: 12,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return ProductCard(
              product: product,
              onPress: () => _onProductTap(product),
            );
          },
        );
      },
    );
  }
}