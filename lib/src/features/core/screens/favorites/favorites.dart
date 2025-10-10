import 'package:aaliyahs_collection_estore/bottom_nav.dart';
import 'package:aaliyahs_collection_estore/provider/favorite_provider.dart';
import 'package:aaliyahs_collection_estore/src/constants/colors.dart';
import 'package:aaliyahs_collection_estore/src/constants/image_strings.dart';
import 'package:aaliyahs_collection_estore/src/constants/text_strings.dart';
import 'package:aaliyahs_collection_estore/src/features/core/models/product.dart';
import 'package:aaliyahs_collection_estore/src/features/core/screens/cart/widgets/error_info.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;

    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;
    var isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

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
          AaliyahFavoriteText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: finalList.isEmpty
          ? _buildEmptyFavorites(context, isDesktop)
          : _buildFavoriteList(finalList, isDarkMode),
    );
  }

  Widget _buildFavoriteList(List<Product> favorites, bool isDarkMode) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final favoriteItem = favorites[index];
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode ? AaliyahSecondaryColor : AaliyahPrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    height: 85,
                    width: 85,
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(favoriteItem.image),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        favoriteItem.name,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        favoriteItem.category,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Rs. ${favoriteItem.price}",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isDarkMode ? AaliyahDarkColor : AaliyahLightColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () {
                  favorites.removeAt(index);
                  setState(() {});
                },
                icon: Icon(
                  Icons.delete,
                  color: isDarkMode ? AaliyahPrimaryColor : AaliyahSecondaryColor,
                  size: 22,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmptyFavorites(BuildContext context, bool isDesktop) {
    return SafeArea(
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isDesktop ? 600 : double.infinity,
          ),
          padding: EdgeInsets.all(isDesktop ? 40 : 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Illustration
              SizedBox(
                width: isDesktop ? 300 : 250,
                height: isDesktop ? 200 : 250,
                child: Image.asset(
                  emptyFavoritesIllustration, // <-- Use your empty favorite image here
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),

              // Text Content
              ErrorInfo(
                title: "No Favorites Yet!",
                description:
                    "You haven't added any products to your favorites. Start exploring and save your favorites here!",
                btnText: "Discover Products",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomNavBar()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
