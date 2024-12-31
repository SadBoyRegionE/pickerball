import 'package:flutter/material.dart';
import '../theme.dart'; // Import file theme

class ProductCategory extends StatelessWidget {
  final List<Map<String, dynamic>> categories; // Định nghĩa tham số categories

  const ProductCategory({super.key, required this.categories}); // Sử dụng required cho tham số

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        shrinkWrap: true, // Để tránh lỗi overflow trong ListView
        physics: const NeverScrollableScrollPhysics(), // Vô hiệu cuộn riêng của GridView
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5, // Hiển thị 5 danh mục trên một hàng
          crossAxisSpacing: 10, // Khoảng cách giữa các cột
          mainAxisSpacing: 10, // Khoảng cách giữa các hàng
          childAspectRatio: 0.8, // Điều chỉnh tỷ lệ phù hợp
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            icon: categories[index]["icon"],
            name: categories[index]["name"],
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const CategoryItem({required this.icon, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: pinkColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 24, // Giảm kích thước icon
            color: whiteColor,
          ),
        ),
        const SizedBox(height: 8),
        Flexible(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 13, // Giảm kích thước chữ
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
