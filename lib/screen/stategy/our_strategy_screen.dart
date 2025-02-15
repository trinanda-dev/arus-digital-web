import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;


class OurStrategyScreen extends StatelessWidget {
  const OurStrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Judul
          Text(
            "OUR STRATEGY",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade600,
              letterSpacing: 1.2,
              fontFamily: "Urbanist"
            ),
          ),
          const SizedBox(height: 10),

          // Heading
          const Text(
            "Here are 5 working steps to\norganize our projects.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: "Urbanist"
            ),
          ),
          const SizedBox(height: 10),

          // Deskripsi
          const Text(
            "We integrate Design Thinking into our software development process to create user-centric, innovative, and scalable solutions. \n"
            "By emphasizing empathy, iterative problem-solving, and continuous refinement, we ensure that our products address real-world challenges effectively. \n"
            "Our approach involves understanding user needs, defining key pain points, ideating creative solutions, rapidly prototyping, and validating through user feedback, ensuring a seamless and impactful digital experience.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              height: 1.5,
              fontFamily: "Urbanist"
            ),
          ),
          const SizedBox(height: 30),

          // Daftar langkah strategi (Center-aligned)
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 600, // Agar tidak terlalu lebar di desktop
            ),
            child: Column(
              children: const [
                // Menampilkan 5 langkah Design Thinking
                StrategyStep(number: "01", title: "Empathize", description: "Understand user needs through research, observation, and direct engagement."),
                StrategyStep(number: "02", title: "Define", description: "Clearly articulate the problem based on insights gathered during the empathize phase."),
                StrategyStep(number: "03", title: "Ideate", description: "Generate a wide range of creative solutions through brainstorming and collaborative discussions."),
                StrategyStep(number: "04", title: "Prototype", description: "Develop low-fidelity and high-fidelity prototypes to test concepts quickly."),
                StrategyStep(number: "05", title: "Test", description: "Validate the solution through real-world testing and iterate based on user feedback."),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Tombol "Learn More" (Center-aligned)
          ElevatedButton(
            onPressed: () async {
              final Uri url = Uri.parse("https://online.hbs.edu/blog/post/what-is-design-thinking");

              if (kIsWeb) {
                html.window.open(url.toString(), "_blank"); // Buka di tab baru di Web
              } else {
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication); // Buka di browser di Mobile
                } else {
                  throw "Could not launch $url";
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
            ),
            child: const Text(
              "Learn More",
              style: TextStyle(
                fontSize: 16, 
                color: Colors.white,
                fontFamily: "Urbanist"
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk langkah strategi
class StrategyStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const StrategyStep({
    super.key,
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Nomor langkah
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade600,
                fontFamily: "Urbanist"
              ),
            ),
          ),
          const SizedBox(width: 20),

          // Teks langkah strategi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: "Urbanist"
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
                    fontFamily: "Urbanist"
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}