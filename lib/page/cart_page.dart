import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartProducts = [
    {
      "image": "assets/Vot/sp1.png",
      "name": "Joola Ben Johns Hyperion 3 16mm",
      "variant": "16mm",
      "price": 5999000,
      "quantity": 1
    },
    {
      "image": "assets/Vot/sp2.png",
      "name": "Joola Ben Johns Hyperion 3 14mm",
      "variant": "14mm",
      "price": 5999000,
      "quantity": 1
    },
  ];

  String formatCurrency(int value) {
    return '${NumberFormat('#,###', 'vi').format(value)} đ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Giỏ Hàng',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            color: whiteColor,
          ),
        ),
        backgroundColor: pinkColor,
        centerTitle: true,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: whiteColor),
            onPressed: () {
              setState(() {
                cartProducts.clear(); // Xóa tất cả sản phẩm
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Giao hàng đến',
              style: GoogleFonts.firaSans(
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
          ),
          Divider(color: insideIconInactiveColor),
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                final product = cartProducts[index];
                return _buildCartItem(
                  image: product['image'],
                  title: product['name'],
                  variant: 'Biến thể: ${product['variant']}',
                  price: product['price'],
                  quantity: product['quantity'],
                  onRemove: () {
                    setState(() {
                      cartProducts.removeAt(index);
                    });
                  },
                  onIncrease: () {
                    setState(() {
                      product['quantity']++;
                    });
                  },
                  onDecrease: () {
                    setState(() {
                      if (product['quantity'] > 1) product['quantity']--;
                    });
                  },
                ).animate().scaleXY(begin: 0.9, end: 1.0, duration: 700.ms);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng số tiền',
                  style: GoogleFonts.firaSans(
                    fontWeight: FontWeight.w700,
                    color: blackColor,
                  ),
                ),
                Text(
                  formatCurrency(cartProducts.fold(
                      0,
                      (sum, item) =>
                          sum +
                          (item['price'] as int) * (item['quantity'] as int))),
                  style: GoogleFonts.firaSans(
                    fontWeight: FontWeight.w700,
                    color: insideColorIconOnColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Chức năng thanh toán
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: pinkColor,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  shadowColor: Colors.black26,
                  elevation: 6,
                ),
                child: Center(
                  child: Text(
                    'Thanh toán',
                    style: GoogleFonts.firaSans(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCartItem({
    required String image,
    required String title,
    required String variant,
    required int price,
    required int quantity,
    required VoidCallback onRemove,
    required VoidCallback onIncrease,
    required VoidCallback onDecrease,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      variant,
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatCurrency(price),
                          style: GoogleFonts.firaSans(
                            fontWeight: FontWeight.w600,
                            color: insideColorIconOnColor,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: onDecrease,
                              icon: Icon(Icons.remove_circle,
                                  color: insideIconInactiveColor),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: Text(
                                '$quantity',
                                key: ValueKey<int>(
                                    quantity), // Dùng key để nhận diện sự thay đổi
                                style: GoogleFonts.firaSans(
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: onIncrease,
                              icon: Icon(Icons.add_circle,
                                  color: insideColorIconOnColor),
                            ),
                            IconButton(
                              onPressed: onRemove,
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
