import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import thư viện animate
import '../theme.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product; // Thông tin sản phẩm

  const ProductDetailPage({super.key, required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1; // Khởi tạo số lượng là 1
  bool _showFullDescription = false; // Điều khiển việc ẩn/hiện mô tả

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mô tả sản phẩm:",
            style: GoogleFonts.firaSans(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    _showFullDescription
                        ? "Đây là một sản phẩm cao cấp, mang lại hiệu suất tối ưu cho người sử dụng. Nó được thiết kế với công nghệ mới, giúp bạn có những trải nghiệm tuyệt vời trong khi chơi thể thao."
                        : "Đây là một sản phẩm cao cấp, mang lại hiệu suất tối ưu.",
                    style: GoogleFonts.firaSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ).animate().fadeIn(duration: 1000.ms),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _showFullDescription = !_showFullDescription;
                      });
                    },
                    child: Text(
                      _showFullDescription ? "Thu gọn" : "Xem thêm",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w500,
                        color: pinkColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thông tin sản phẩm",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: whiteColor,
            letterSpacing: 1.2,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: pinkColor,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh sản phẩm với hiệu ứng
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.product['image'],
                fit: BoxFit.cover,
                height: 400,
                width: double.infinity,
              ).animate().fadeIn(duration: 1000.ms),
            ),
            const SizedBox(height: 20),

            // Tên sản phẩm
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.product['name'],
                style: GoogleFonts.firaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Giá và số lượng sản phẩm
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Giá: ${widget.product['price']}",
                    style: GoogleFonts.firaSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: pinkColor,
                    ),
                  ),
                  // Nút điều chỉnh số lượng
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _decrementQuantity,
                        child: CircleAvatar(
                          backgroundColor: pinkColor,
                          radius: 18,
                          child: Icon(
                            Icons.remove,
                            color: whiteColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Text(
                          "$quantity",
                          key: ValueKey<int>(quantity),
                          style: GoogleFonts.firaSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: _incrementQuantity,
                        child: CircleAvatar(
                          backgroundColor: pinkColor,
                          radius: 18,
                          child: Icon(
                            Icons.add,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Mô tả sản phẩm với hiệu ứng
            _buildDescription().animate().fadeIn(duration: 300.ms),

            const SizedBox(height: 20),

            // Thông tin chi tiết sản phẩm
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Thông tin chi tiết:",
                style: GoogleFonts.firaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Thương hiệu: Passion",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Nhà cung cấp: Pickleball Việt Nam",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Loại sản phẩm: Bóng Pickleball",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Tình trạng: Mới 100%",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Bảo hành: Chính hãng",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Giao hàng: Toàn quốc",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Nút hành động với hiệu ứng
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Đã thêm vào giỏ hàng")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      backgroundColor: pinkColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Thêm vào giỏ hàng",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: whiteColor,
                      ),
                    ),
                  ).animate().fadeIn(duration: 300.ms),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Mua ngay")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      backgroundColor: pinkColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Mua ngay",
                      style: GoogleFonts.firaSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: whiteColor,
                      ),
                    ),
                  ).animate().fadeIn(duration: 300.ms),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
