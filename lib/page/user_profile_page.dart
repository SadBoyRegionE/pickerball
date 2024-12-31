import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart'; // Import thư viện
import '../theme.dart';
import '../widget/bottom_navigation_bar.dart';
import '../page/home_page.dart';
import '../page/transaction_history_page.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  int _selectedIndex = 1; // Mục mặc định là Tài khoản

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      // Điều hướng trang
      if (index == 0) {
        // Quay về trang chủ
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false,
        ).then((_) {
          // Khi quay về trang chủ, không cần làm gì thêm ở đây
        });
      } else if (index == 1) {
        // Đang ở trang Tài khoản, không cần điều hướng
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thông tin người dùng",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: whiteColor,
          ),
        ),
        backgroundColor: pinkColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Avatar người dùng với hiệu ứng scale và fade
              Center(
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      "assets/pages/logo2.png"), // Thay bằng ảnh avatar của bạn
                )
                    .animate()
                    .scaleXY(begin: 0.8, end: 1.0, duration: 300.ms)
                    .fadeIn(duration: 500.ms),
              ),
              const SizedBox(height: 20),

              // Tên người dùng với hiệu ứng fadeIn
              Center(
                child: Text(
                  "Trân Lê Huy Tín",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ).animate().fadeIn(duration: 500.ms),
              ),
              const SizedBox(height: 5),

              // Email với hiệu ứng fadeIn
              Center(
                child: Text(
                  "huy.tin@gmail.com",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ).animate().fadeIn(duration: 500.ms),
              ),
              const SizedBox(height: 20),

              // Thông tin người dùng
              const Divider(),
              Text(
                "Thông tin cá nhân",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              )
                  .animate()
                  .slide(
                      begin: const Offset(-1, 0),
                      end: const Offset(0, 0),
                      duration: 500.ms)
                  .fadeIn(duration: 500.ms),
              const SizedBox(height: 10),

              // Các ListTile sẽ xuất hiện từ trái sang phải
              _buildInfoTile(Icons.phone, "Số điện thoại", "0392460501"),
              _buildInfoTile(
                  Icons.location_on, "Địa chỉ", "8386, Tai Loc, TP. HCM"),
              _buildInfoTile(Icons.calendar_today, "Ngày sinh", "08/03/1986"),

              const Divider(),

              // Các tùy chọn khác
              Text(
                "Cài đặt",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              )
                  .animate()
                  .slide(
                      begin: const Offset(-1, 0),
                      end: const Offset(0, 0),
                      duration: 500.ms)
                  .fadeIn(duration: 500.ms),
              const SizedBox(height: 10),

              _buildSettingTile(Icons.monetization_on, "Lịch sử thanh toán",
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionHistoryPage()),
                );
              }),

              _buildSettingTile(Icons.lock, "Đổi mật khẩu", () {
                // Thêm chức năng đổi mật khẩu
              }),

              _buildSettingTile(Icons.exit_to_app, "Đăng xuất", () {
                // Thêm chức năng đăng xuất
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: pinkColor),
      title: Text(title),
      subtitle: Text(subtitle),
    )
        .animate()
        .slide(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0),
            duration: 500.ms)
        .fadeIn(duration: 500.ms);
  }

  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: pinkColor),
      title: Text(title),
      onTap: onTap,
    )
        .animate()
        .slide(
            begin: const Offset(-1, 0),
            end: const Offset(0, 0),
            duration: 500.ms)
        .fadeIn(duration: 500.ms);
  }
}
