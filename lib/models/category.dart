

class Category {
  final String title;
  final String image;

  Category({required this.title, required this.image});
}

// ✅ Make the list static so it can be accessed easily
final List<Category> categories = [
  Category(title: "Abaya", image: "assets/icons/abaya_category.png"),
  Category(title: "Dress", image: "assets/icons/dress_category.png"),
  Category(title: "Hijab", image: "assets/icons/hijab_category.png"),
  Category(title: "Accessory", image: "assets/icons/accessory_category.png"),
];
