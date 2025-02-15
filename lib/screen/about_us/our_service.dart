import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OurServiceScreen extends StatelessWidget {
  const OurServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Stack(
      children: [
        // Background SVG
        Positioned.fill(
          child: SvgPicture.asset(
            "assets/images/background_our_service.svg",
            fit: BoxFit.cover,
          ),
        ),

        // Konten di atas background
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Judul Section
                Text(
                  "WHAT WE DO?",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Urbanist",
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade600,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "The service we offer is specifically\ndesigned to meet your needs.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Urbanist",
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 50),

                // GridView untuk tampilan responsif
                LayoutBuilder(
                  builder: (context, constraints) {
                    return GridView.count(
                      crossAxisCount: isMobile ? 1 : isTablet ? 2 : 4,
                      shrinkWrap: true,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: isMobile ? 1.3 : 1.0,
                      children: [
                        ServiceCard(
                          imagePath: "assets/images/png/web_design.png",
                          title: "Web Design",
                          description: "We build responsive, fast, and user-friendly websites.\nUtilizing modern technologies to ensure an optimal user experience.",
                          showDescription: !isMobile,
                        ),
                        ServiceCard(
                          imagePath: "assets/images/png/grapic_design.png",
                          title: "Graphic Design",
                          description: "We craft visually stunning and impactful designs.\nFrom branding and marketing materials to digital illustrations and UI elements.",
                          showDescription: !isMobile,
                        ),
                        ServiceCard(
                          imagePath: "assets/images/png/ai.png",
                          title: "AI",
                          description: "Developing AI-powered solutions, including machine learning, automation, and intelligent systems,\nfor smarter business operations and user experiences.",
                          showDescription: !isMobile,
                        ),
                        ServiceCard(
                          imagePath: "assets/images/png/android.png",
                          title: "Mobile Apps",
                          description: "Creating innovative and responsive mobile apps for iOS and Android \nand robust functionalities for the best user experience.",
                          showDescription: !isMobile,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Widget untuk layanan dengan ukuran dinamis
class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool showDescription; // Tambahkan variabel untuk menyembunyikan deskripsi di mobile

  const ServiceCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.showDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          width: 120,
          height: 100,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: "Urbanist",
          ),
        ),
        const SizedBox(height: 5),
        
        // Menampilkan deskripsi hanya jika showDescription = true
        if (showDescription)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.6,
                fontFamily: "Urbanist",
              ),
            ),
          ),
        
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Learn More →",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade600,
              fontFamily: "Urbanist",
            ),
          ),
        ),
      ],
    );
  }
}
