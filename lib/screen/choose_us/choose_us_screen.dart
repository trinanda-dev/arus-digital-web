import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseUsScreen extends StatelessWidget {
  const ChooseUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.9;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768; // Cek apakah tampilan mobile

    return SizedBox(
      width: double.infinity,
      height: screenHeight, // Mengatur tinggi menjadi 90% dari layar
      child: Stack(
        children: [
          // Background SVG
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/choose.svg', // Sesuaikan path sesuai lokasi file SVG
              fit: BoxFit.cover,
            ),
          ),

          // Konten
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Layout Gambar & Text (Responsive)
                    isMobile
                        ? Column(
                            children: [
                              Image.asset(
                                "assets/images/png/choose_us.png",
                                width: 300,
                                height: 250,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 30),
                              _buildTextContent(),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  "assets/images/png/choose_us.png",
                                  width: 400,
                                  height: 350,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                flex: 1,
                                child: _buildTextContent(),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk konten teks di sebelah kanan gambar
  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "WHY CHOOSE US?",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.blue.shade600,
            fontFamily: "Urbanist",
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "We bring solutions to make life easier.",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: "Urbanist",
          ),
        ),
        const SizedBox(height: 15),

        // Konten baru dengan desain yang lebih profesional
        _buildExpandableItem(
          title: "Innovation-Driven Solutions",
          description:
              "We leverage cutting-edge technologies such as AI, cloud computing, and automation to develop scalable, efficient, and future-proof digital solutions.",
        ),
        _buildExpandableItem(
          title: "Tailored & Scalable Development",
          description:
              "Unlike generic solutions, we offer custom-built software that adapts to your specific business needs and grows with your company.",
        ),
        _buildExpandableItem(
          title: "Remote-First & Agile Approach",
          description:
              "Our remote-first methodology allows us to collaborate efficiently, ensuring cost-effective, flexible, and rapid execution while maintaining top-tier quality.",
        ),
        _buildExpandableItem(
          title: "Full-Service Digital Transformation",
          description:
              "From web & mobile app development to SaaS solutions and AI integration, we provide end-to-end digital services to help businesses scale and optimize operations.",
        ),
        _buildExpandableItem(
          title: "Cost-Effective & High-Quality Service",
          description:
              "Hiring an in-house tech team is expensive. We provide affordable yet high-performance solutions, reducing operational costs without compromising quality.",
        ),
        _buildExpandableItem(
          title: "Long-Term Support & Continuous Improvement",
          description:
              "Beyond development, we offer maintenance, optimization, and growth consulting, ensuring that your digital solutions evolve with market trends.",
        ),
        _buildExpandableItem(
          title: "Security & Reliability",
          description:
              "We prioritize data security, compliance, and system stability, ensuring trustworthy and high-performing digital products.",
        ),
      ],
    );
  }

  // Widget untuk bagian expandable list (accordion)
  Widget _buildExpandableItem({required String title, required String description}) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontFamily: "Urbanist",
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 10, bottom: 10),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.5,
              fontFamily: "Urbanist",
            ),
          ),
        ),
      ],
    );
  }
}