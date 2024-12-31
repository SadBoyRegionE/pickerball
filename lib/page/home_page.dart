import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';
import '../widget/custom_app_bar.dart';
import '../widget/banner_ad.dart';
import '../widget/product_category.dart';
import '../widget/bottom_navigation_bar.dart';
import '../page/product_detail_page.dart';
import '../page/user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserProfilePage()),
      ).then((_) {
        setState(() {
          _selectedIndex = 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"icon": Icons.sports_tennis, "name": "Vợt"},
      {"icon": Icons.sports_baseball, "name": "Bóng"},
      {"icon": Icons.backpack, "name": "Phụ kiện"},
      {"icon": Icons.checkroom, "name": "Quần áo"},
      {"icon": Icons.dashboard, "name": "Tất cả"},
    ];

    final List<Map<String, dynamic>> recentProducts = [
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
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const BannerAd().animate().fadeIn(duration: 700.ms),
                const SizedBox(height: 20),
                ProductCategory(categories: categories).animate().slideX(
                    duration: 800.ms, begin: 1.0, curve: Curves.easeOut),
                const SizedBox(height: 20),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.55,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = recentProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150,
                              width: double.infinity,
                              child: Image.asset(
                                product['image'],
                                fit: BoxFit.cover,
                              ),
                            ).animate().scaleXY(
                                begin: 0.7, end: 1.0, duration: 400.ms),
                            const SizedBox(height: 10),
                            Text(
                              product['name'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              product['price'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                // Nút "Thêm vào giỏ hàng" chỉ hiển thị icon
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Chức năng thêm vào giỏ hàng
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      backgroundColor: pinkColor, // Màu nền
                                      foregroundColor: whiteColor, // Màu icon
                                    ),
                                    child: const Icon(Icons.add_shopping_cart,
                                        size: 20), // Icon giỏ hàng
                                  ),
                                ),
                                const SizedBox(
                                    width: 8), // Khoảng cách giữa hai nút

                                // Nút "Mua ngay" chỉ hiển thị icon
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      // Chức năng mua ngay
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.redAccent,
                                            Colors.pink
                                          ],
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.attach_money, // Icon túi mua sắm
                                        size: 20,
                                        color: Colors.white, // Màu icon
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
                childCount: recentProducts.length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
