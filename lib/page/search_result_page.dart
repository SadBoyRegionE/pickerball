import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import flutter_animate
import '../theme.dart';
import '../page/home_page.dart';
import 'product_detail_page.dart'; // Import ProductDetailPage

class SearchResultsPage extends StatelessWidget {
  final String searchQuery;
  final List<Map<String, String>> searchResults;

  const SearchResultsPage(
      {super.key, required this.searchQuery, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> searchResults = [
      {
        "image": "assets/Vot/sp1.png",
        "name": "Joola Ben Johns Hyperion 3 16mm",
        "price": "5,999,000 đ"
      },
      {
        "image": "assets/Vot/sp2.png",
        "name": "Joola Ben Johns Hyperion 3 14mm",
        "price": "5,999,000 đ"
      },
      {
        "image": "assets/Vot/sp3.png",
        "name": "Joola Ben Johns Hyperion 3 14mm",
        "price": "5,999,000 đ"
      },
      {
        "image": "assets/Vot/sp4.png",
        "name": "Joola Ben Johns Hyperion 3 14mm",
        "price": "5,999,000 đ"
      },
      {
        "image": "assets/Vot/sp1.png",
        "name": "Joola Ben Johns Hyperion 3 16mm",
        "price": "5,999,000 đ"
      },
      {
        "image": "assets/Vot/sp2.png",
        "name": "Joola Ben Johns Hyperion 3 14mm",
        "price": "5,999,000 đ"
      },
      {
        "image": "assets/Vot/sp3.png",
        "name": "Joola Ben Johns Hyperion 3 14mm",
        "price": "5,999,000 đ"
      },
      {
        "image": "assets/Vot/sp4.png",
        "name": "Joola Ben Johns Hyperion 3 14mm",
        "price": "5,999,000 đ"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tìm kiếm '$searchQuery'",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: whiteColor,
            letterSpacing: 1.2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        backgroundColor: pinkColor,
        elevation: 8,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.55,
          ),
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            final product = searchResults[index];
            return Animate(
              effects: [
                FadeEffect(duration: 300.ms), // Hiệu ứng fade
                ScaleEffect(
                  begin: const Offset(
                      0.8, 0.8), // Thay đổi từ 80% đến 100% trên cả trục x và y
                  end: const Offset(
                      1.0, 1.0), // Kết thúc ở tỷ lệ 100% trên cả trục x và y
                  duration: 300.ms, // Thời gian thực hiện hiệu ứng
                ),
              ],
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Image.asset(
                            product['image']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Tên sản phẩm
                      SizedBox(
                        height: 40,
                        child: Text(
                          product['name']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.firaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Giá sản phẩm
                      SizedBox(
                        height: 20,
                        child: Text(
                          product['price']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.firaSans(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Chức năng thêm vào giỏ hàng
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                backgroundColor: pinkColor,
                                foregroundColor: whiteColor,
                              ),
                              child:
                                  const Icon(Icons.add_shopping_cart, size: 20),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Mở trang chi tiết sản phẩm
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailPage(product: product),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: const LinearGradient(
                                    colors: [Colors.redAccent, Colors.pink],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.attach_money,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
