class Product {
  final int id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String currency;
  final int discount;
  final double oldPrice;
  final double rating;
  final int reviews;
  final List<String> colors;
  final List<String> sizes;
  final String? material;
  final String? sole;
  final List<String> features;
  final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.currency,
    required this.discount,
    required this.oldPrice,
    required this.rating,
    required this.reviews,
    required this.colors,
    required this.sizes,
    this.material,
    this.sole,
    required this.features,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Manejar id como string o número
    final id = json['id'];
    final intId = id is int ? id : int.parse(id.toString());
    
    return Product(
      id: intId,
      name: json['name'] as String,
      brand: json['brand'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      discount: json['discount'] as int,
      oldPrice: (json['old_price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'] as int,
      colors: List<String>.from(json['colors'] as List),
      sizes: List<String>.from(json['sizes'] as List),
      material: json['material'] as String?,
      sole: json['sole'] as String?,
      features: List<String>.from(json['features'] as List),
      images: List<String>.from(json['images'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'description': description,
      'price': price,
      'currency': currency,
      'discount': discount,
      'old_price': oldPrice,
      'rating': rating,
      'reviews': reviews,
      'colors': colors,
      'sizes': sizes,
      'material': material,
      'sole': sole,
      'features': features,
      'images': images,
    };
  }
}

class Category {
  final int id;
  final String name;
  final List<Product> products;

  Category({
    required this.id,
    required this.name,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    // Manejar id como string o número
    final id = json['id'];
    final intId = id is int ? id : int.parse(id.toString());
    
    return Category(
      id: intId,
      name: json['name'] as String,
      products: (json['products'] as List)
          .map((productJson) => Product.fromJson(productJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
