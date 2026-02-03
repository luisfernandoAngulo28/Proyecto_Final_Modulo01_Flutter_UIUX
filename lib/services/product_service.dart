import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  // URL de tu servidor JSON
  static const String baseUrl = 'http://localhost:3000';
  
  static Future<List<Product>> loadProducts() async {
    try {
      print('========================================');
      print('🔄 Fetching products from: $baseUrl/categories');
      
      // Hacer petición HTTP al servidor
      final response = await http.get(
        Uri.parse('$baseUrl/categories'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(Duration(seconds: 10));
      
      print('📡 Response status: ${response.statusCode}');
      print('📦 Response body length: ${response.body.length}');
      
      if (response.statusCode == 200) {
        print('✅ Status 200 - Parsing JSON...');
        
        // Parsear el JSON
        final categoriesList = json.decode(response.body) as List;
        print('📂 Categories loaded: ${categoriesList.length}');
        
        // Obtener la primera categoría (calzado)
        if (categoriesList.isNotEmpty) {
          print('🔍 Parsing first category...');
          final category = Category.fromJson(categoriesList[0] as Map<String, dynamic>);
          print('👟 Products loaded: ${category.products.length}');
          print('========================================');
          return category.products;
        }
        
        print('⚠️ No categories found in response');
        print('========================================');
        return [];
      } else {
        print('❌ Error: Status code ${response.statusCode}');
        print('Response body: ${response.body}');
        print('========================================');
        return [];
      }
    } catch (e, stackTrace) {
      print('❌ EXCEPTION loading products:');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      print('========================================');
      return [];
    }
  }

  static Future<Product?> getProductById(int id) async {
    final products = await loadProducts();
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  static Future<List<Product>> searchProducts(String query) async {
    final products = await loadProducts();
    final lowerQuery = query.toLowerCase();
    
    return products.where((product) {
      return product.name.toLowerCase().contains(lowerQuery) ||
             product.brand.toLowerCase().contains(lowerQuery) ||
             product.description.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  static Future<List<Product>> getProductsByPriceRange(double min, double max) async {
    final products = await loadProducts();
    
    return products.where((product) {
      return product.price >= min && product.price <= max;
    }).toList();
  }

  static Future<List<Product>> getBestSellers() async {
    final products = await loadProducts();
    
    // Ordenar por número de reviews (los más populares)
    products.sort((a, b) => b.reviews.compareTo(a.reviews));
    
    // Retornar los mejores 10
    return products.take(10).toList();
  }
}
