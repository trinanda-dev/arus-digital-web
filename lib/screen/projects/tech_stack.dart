import 'package:flutter/material.dart';

class TechStackScreen extends StatelessWidget {
  const TechStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768; // Deteksi tampilan Mobile

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Text(
            "OUR TECH STACK",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade600,
              letterSpacing: 1.2,
              fontFamily: "Urbanist",
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Technologies We Use",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: "Urbanist",
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "We specialize in a wide range of modern technologies to build scalable and high-performance applications.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontFamily: "Urbanist",
            ),
          ),
          const SizedBox(height: 40),

          // Grid Tech Stack yang responsif
          _buildTechStackGrid(screenWidth, isMobile),
        ],
      ),
    );
  }

  // GridView untuk daftar Tech Stack agar responsif
  Widget _buildTechStackGrid(double screenWidth, bool isMobile) {
    int crossAxisCount = screenWidth > 1200 ? 4 : (screenWidth > 800 ? 3 : 2); // Jumlah kolom menyesuaikan layar

    return Align(
      alignment: Alignment.center,
      child: GridView.count(
        crossAxisCount: crossAxisCount, // Menyesuaikan jumlah kolom
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2,
        children: const [
          TechStackCard(
            name: "Flutter",
            imagePath: "assets/images/png/Flutter.png",
            description: "Cross-platform UI framework for mobile, web, and desktop.",
          ),
          TechStackCard(
            name: "Laravel",
            imagePath: "assets/images/png/Laravel.png",
            description: "Robust PHP framework for scalable web applications.",
          ),
          TechStackCard(
            name: "React",
            imagePath: "assets/images/png/React.png",
            description: "JavaScript library for building interactive UIs.",
          ),
          TechStackCard(
            name: "Node.js",
            imagePath: "assets/images/png/NodeJs.png",
            description: "Fast and scalable backend for real-time applications.",
          ),
          TechStackCard(
            name: "Python",
            imagePath: "assets/images/png/Python.png",
            description: "Versatile programming language for AI and backend.",
          ),
          TechStackCard(
            name: "MongoDB",
            imagePath: "assets/images/png/MonggoDB.png",
            description: "A flexible and scalable NoSQL database for modern applications.",
          ),
          TechStackCard(
            name: "PostgreSQL",
            imagePath: "assets/images/png/Postgress.png",
            description: "Advanced relational database with high performance.",
          ),
          TechStackCard(
            name: "MySQL",
            imagePath: "assets/images/png/MySQL.png",
            description: "A powerful open-source relational database for scalable applications.",
          ),
          TechStackCard(
            name: "CodeIgniter",
            imagePath: "assets/images/png/CI.png",
            description: "Lightweight PHP framework for fast and secure web development.",
          ),
        ],
      ),
    );
  }
}

// Widget untuk Kartu Tech Stack
class TechStackCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;

  const TechStackCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768; // Jika tampilan mobile, hanya tampilkan gambar

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Tech Stack
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),

            // Tampilkan Nama & Deskripsi hanya jika bukan tampilan mobile
            if (!isMobile) ...[
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: "Urbanist",
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontFamily: "Urbanist",
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
