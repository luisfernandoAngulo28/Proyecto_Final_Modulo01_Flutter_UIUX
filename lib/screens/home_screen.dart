import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import 'product_detail_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> products = [];
  List<Product> displayedProducts = [];
  bool isLoading = true;
  String selectedCategory = 'All Shoes';
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadProducts() async {
    print('🏠 HOME: Starting to load products...');
    setState(() {
      isLoading = true;
    });
    
    final loadedProducts = await ProductService.loadProducts();
    
    print('🏠 HOME: Received ${loadedProducts.length} products');
    
    setState(() {
      products = loadedProducts;
      displayedProducts = loadedProducts;
      isLoading = false;
    });
    
    print('🏠 HOME: State updated - isLoading: $isLoading, products count: ${products.length}');
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      
      if (category == 'All Shoes') {
        displayedProducts = products;
      } else {
        // Filtrar por características del producto
        displayedProducts = products.where((product) {
          final features = product.features.join(' ').toLowerCase();
          final name = product.name.toLowerCase();
          final categoryLower = category.toLowerCase();
          return features.contains(categoryLower) || name.contains(categoryLower);
        }).toList();
      }
      
      // Si hay búsqueda activa, aplicarla también
      if (searchController.text.isNotEmpty) {
        searchProducts(searchController.text);
      }
    });
  }

  void searchProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        // Si no hay búsqueda, aplicar solo el filtro de categoría
        filterByCategory(selectedCategory);
      } else {
        final lowerQuery = query.toLowerCase();
        displayedProducts = (selectedCategory == 'All Shoes' ? products : displayedProducts)
            .where((product) {
          return product.name.toLowerCase().contains(lowerQuery) ||
                 product.brand.toLowerCase().contains(lowerQuery) ||
                 product.description.toLowerCase().contains(lowerQuery);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, size: 28, color: Color(0xFF2B2B2B)),
                    Text(
                      'Explore',
                      style: TextStyle(
                        color: Color(0xFF2B2B2B),
                        fontSize: 32,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: Icon(Icons.shopping_bag_outlined, size: 20),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFC1500),
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
                // Search Bar
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Color(0xFF6A6A6A), size: 20),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          onChanged: searchProducts,
                          decoration: InputDecoration(
                            hintText: 'Looking for shoes',
                            hintStyle: TextStyle(
                              color: Color(0xFF6A6A6A),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: TextStyle(
                            color: Color(0xFF2B2B2B),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      if (searchController.text.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            searchController.clear();
                            searchProducts('');
                            setState(() {});
                          },
                          child: Icon(Icons.clear, color: Color(0xFF6A6A6A), size: 18),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                // Category Filters
                Text(
                  'Select Category',
                  style: TextStyle(
                    color: Color(0xFF2B2B2B),
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryButton('All Shoes'),
                      SizedBox(width: 12),
                      _buildCategoryButton('Outdoor'),
                      SizedBox(width: 12),
                      _buildCategoryButton('Tennis'),
                      SizedBox(width: 12),
                      _buildCategoryButton('Running'),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                // Products Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Shoes',
                      style: TextStyle(
                        color: Color(0xFF2B2B2B),
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${displayedProducts.length} items',
                      style: TextStyle(
                        color: Color(0xFF6A6A6A),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // Products Grid
                isLoading
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : displayedProducts.isEmpty
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.all(40),
                              child: Column(
                                children: [
                                  Icon(Icons.search_off, size: 64, color: Colors.grey),
                                  SizedBox(height: 16),
                                  Text(
                                    'No products found',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Try a different search or filter',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.65,
                            ),
                            itemCount: displayedProducts.length,
                            itemBuilder: (context, index) {
                              return _buildProductCard(displayedProducts[index]);
                            },
                          ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    final isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () => filterByCategory(category),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: ShapeDecoration(
          color: isSelected ? Color(0xFF0D6EFD) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: [
            if (isSelected)
              BoxShadow(
                color: Color(0x200D6EFD),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
          ],
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF2B2B2B),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF6F6F8),
              ),
              child: product.images.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        product.images[0],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(Icons.image, color: Colors.grey, size: 40),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Icon(Icons.image, color: Colors.grey, size: 40),
                    ),
            ),
            SizedBox(height: 8),
            // Badge BEST SELLER o Descuento
            if (product.reviews > 1000 || product.discount > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (product.reviews > 1000)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Color(0xFF0D6EFD).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'BEST SELLER',
                        style: TextStyle(
                          color: const Color(0xFF0D6EFD),
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  if (product.reviews > 1000 && product.discount > 0)
                    SizedBox(width: 4),
                  if (product.discount > 0)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-${product.discount}%',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            SizedBox(height: 4),
            // Nombre del producto (resumido)
            Text(
              product.name.length > 30
                  ? '${product.name.substring(0, 30)}...'
                  : product.name,
              style: TextStyle(
                color: const Color(0xFF2B2B2B),
                fontSize: 12,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            // Rating
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 14),
                SizedBox(width: 4),
                Text(
                  '${product.rating}',
                  style: TextStyle(
                    color: const Color(0xFF6A6A6A),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  ' (${product.reviews})',
                  style: TextStyle(
                    color: const Color(0xFF6A6A6A),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Precio
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${product.currency} ${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: const Color(0xFF0D6EFD),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 1.14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
