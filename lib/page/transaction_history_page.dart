import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Thêm thư viện flutter_animate
import '../theme.dart';

class TransactionHistoryPage extends StatefulWidget {
  @override
  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  // Dữ liệu mẫu cho lịch sử giao dịch
  final List<Map<String, dynamic>> transactionHistory = [
    {
      'products': [
        {
          'product': 'Joola Ben Johns Hyperion 3 16mm',
          'image': 'assets/Vot/sp1.png',
          'variant': '16 mm',
          'quantity': 1,
          'price': 50000,
        },
        {
          'product': 'Joola Ben Johns Hyperion 3 16mm',
          'image': 'assets/Vot/sp2.png',
          'variant': '18 mm',
          'quantity': 2,
          'price': 60000,
        },
      ],
    },
    {
      'products': [
        {
          'product': 'DHS Hurricane 3 Pro',
          'image': 'assets/Vot/sp3.png',
          'variant': 'Blue',
          'quantity': 1,
          'price': 70000,
        },
        {
          'product': 'Tibhar Evolution MX-P',
          'image': 'assets/Vot/sp4.png',
          'variant': 'Black',
          'quantity': 1,
          'price': 85000,
        },
      ],
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
          'Lịch sử thanh toán',
          style: GoogleFonts.firaSans(
            fontWeight: FontWeight.w700,
            color: whiteColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: pinkColor,
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: transactionHistory.length,
          itemBuilder: (context, index) {
            final transaction = transactionHistory[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: pinkColor.withOpacity(0.7), // Màu nền hồng nhạt cho bill
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Thêm dòng "Chi tiết sản phẩm" vào mỗi bill
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Chi tiết sản phẩm',
                        style: GoogleFonts.firaSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // Danh sách các sản phẩm trong hóa đơn
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: transaction['products'].length,
                      itemBuilder: (context, productIndex) {
                        final product = transaction['products'][productIndex];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                product['image'],
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ).animate().fadeIn(duration: 300.ms),
                            ),
                            title: Text(
                              product['product'],
                              style: GoogleFonts.firaSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: blackColor,
                              ),
                            ).animate().scaleXY(begin: 0.8, end: 1.0, duration: 300.ms).fadeIn(duration: 500.ms),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Biến thể: ${product['variant']}',
                                  style: GoogleFonts.firaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Text(
                                  'Số lượng: ${product['quantity']}',
                                  style: GoogleFonts.firaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ).animate().scaleXY(begin: 0.8, end: 1.0, duration: 300.ms).fadeIn(duration: 500.ms),
                            trailing: Text(
                              formatCurrency(product['price'] * product['quantity']),
                              style: GoogleFonts.firaSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: pinkColor,
                              ),
                            ).animate().scaleXY(begin: 0.8, end: 1.0, duration: 300.ms).fadeIn(duration: 500.ms),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Tổng cộng: ${formatCurrency(transaction['products'].fold(0, (sum, product) => sum + product['price'] * product['quantity']))}',
                        style: GoogleFonts.firaSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
