import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedPage = 0;

  List<IconData> icons = [
    Icons.home_filled,
    Icons.bookmark_border_rounded,
    Icons.shopping_cart_outlined,
    Icons.person_outline_outlined,
  ];

  // Dummy data untuk "popular" dan "rekomendasi"
  final List<Map<String, String>> popular = [
    {"title": "Pantai Indah", "image": "assets/pantai.jpg"},
    {"title": "Gunung Tinggi", "image": "assets/gunung.jpg"},
  ];

  final List<Map<String, String>> rekomendasi = [
    {"title": "Air Terjun Cantik", "image": "assets/airterjun.jpg"},
    {"title": "Hutan Hijau", "image": "assets/hutan.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF4E3CF),
      body: Column(
        children: [
          // AppBar
          buildAppBar(),
          Expanded(
            child: selectedPage == 0
                ? buildHomeContent() // Konten untuk halaman utama
                : Center(
                    child: Text(
                      'Halaman ${selectedPage + 1} belum tersedia',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFF6B4E3D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          // Bottom Navigation Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: buildBottomNavBar(),
          ),
        ],
      ),
    );
  }

  Widget buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          // Popular Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Tempat Populer",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: popular.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: buildCard(item['title']!, item['image']!),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          // Rekomendasi Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Rekomendasi Untuk Kamu",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "NunitoSans",
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: rekomendasi.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: buildCard(item['title']!, item['image']!),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, String image) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
            decoration: BoxDecoration(
              color: const Color(0xFF6B4E3D),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                icons.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  child: Icon(
                    icons[index],
                    size: 36,
                    color: selectedPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFF4E3CF),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: buildSearchButton(),
          ),
        ),
      ),
    );
  }

  Widget buildSearchButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF6B4E3D),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Cari destinasi...',
          hintStyle: TextStyle(
            color: Colors.white54,
            fontSize: 18,
            fontFamily: "NunitoSans",
          ),
          prefixIcon: Icon(Icons.search, color: Colors.white54, size: 28),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: "NunitoSans",
        ),
      ),
    );
  }
}
