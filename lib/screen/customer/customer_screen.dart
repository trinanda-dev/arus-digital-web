import 'package:flutter/material.dart';
import 'dart:math';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Text(
            "HAPPY CUSTOMERS",
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
            "Don't take our word for it. See what customers are saying about us.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: "Urbanist",
            ),
          ),
          const SizedBox(height: 30),

          // Daftar Review (Menggunakan Wrap dengan posisi tidak kaku)
          _buildReviewGrid(),
        ],
      ),
    );
  }

  // Menggunakan Wrap agar grid tidak terlalu sejajar
  Widget _buildReviewGrid() {
    final random = Random();
    final List<Widget> reviews = [
       _buildOffsetCard(
        const CustomerReviewCard(
          name: "James Anderson",
          role: "Founder",
          imagePath: "assets/images/png/te1.png",
          review: "Arus Digital transformed our startup idea into a fully functional mobile app. Their attention to detail and efficiency exceeded our expectations!",
        ),
        random.nextDouble() * 10 - 5,
      ),
      _buildOffsetCard(
        const CustomerReviewCard(
          name: "Sophia Martinez",
          role: "CTO",
          imagePath: "assets/images/png/te2.png",
          review: "The Arus Digital team built a custom e-commerce platform that perfectly fits our business needs. Their expertise in scalability is impressive!",
        ),
        random.nextDouble() * 10 - 5,
      ),
      _buildOffsetCard(
        const CustomerReviewCard(
          name: "Michael Brown",
          role: "CEO",
          imagePath: "assets/images/png/te3.png",
          review: "From planning to execution, Arus Digital delivered an exceptional e-learning platform. The seamless user experience has significantly boosted engagement!",
        ),
        random.nextDouble() * 10 - 5,
      ),
      _buildOffsetCard(
        const CustomerReviewCard(
          name: "Emma Williams",
          role: "Project Manager",
          imagePath: "assets/images/png/te4.png",
          review: "Security and performance were our top priorities, and Arus Digital delivered. Their fintech solutions are reliable, fast, and highly secure!",
        ),
        random.nextDouble() * 10 - 5,
      ),
      _buildOffsetCard(
        const CustomerReviewCard(
          name: "Daniel Scott",
          role: "CMO",
          imagePath: "assets/images/png/te5.png",
          review: "Their innovative approach to AI-based solutions helped us optimize our marketing strategies. Arus Digital truly understands business needs!",
        ),
        random.nextDouble() * 10 - 5,
      ),
    ];
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: reviews,
    );
  }

  // Fungsi untuk memberikan sedikit offset agar tampilan tidak kaku
  Widget _buildOffsetCard(Widget card, double offset) {
    return Transform.translate(
      offset: Offset(0, offset),
      child: card,
    );
  }
}

// Widget untuk Kartu Review
class CustomerReviewCard extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;
  final String review;

  const CustomerReviewCard({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 300, // Tinggi tetap agar seragam
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(5, (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                )),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Text(
                  '"$review"',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontFamily: "Urbanist",
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(imagePath),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontFamily: "Urbanist",
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        role,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontFamily: "Urbanist",
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}