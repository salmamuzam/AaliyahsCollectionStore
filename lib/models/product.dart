class Product {
  final int price;
  final String id;
  final String title;
  final String category;
  final String image;
  final String description;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.category,
    required this.image,
    required this.description,
  });
}


  Product product = Product(
    id: '1',
    price: 100,
    title: 'Example Product',
    category: 'Electronics',
    image: 'image.png',
    description: 'This is a sample product',
  );


