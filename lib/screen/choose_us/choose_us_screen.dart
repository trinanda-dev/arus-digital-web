import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseUsScreen extends StatefulWidget {
  const ChooseUsScreen({super.key});

  @override
  State<ChooseUsScreen> createState() => _ChooseUsScreenState();
}

class _ChooseUsScreenState extends State<ChooseUsScreen> {
  int? selectedIndex; // Menyimpan index item yang sedang terbuka
  final List<Map<String, String>> items = [ // Data item dalam bentuk List
    {
      "title": "Innovation-Driven Solutions",
      "description":
          "We leverage cutting-edge technologies such as AI, cloud computing, and automation to develop scalable, efficient, and future-proof digital solutions.",
    },
    {
      "title": "Tailored & Scalable Development",
      "description":
          "Unlike generic solutions, we offer custom-built software that adapts to your specific business needs and grows with your company.",
    },
    {
      "title": "Remote-First & Agile Approach",
      "description":
          "Our remote-first methodology allows us to collaborate efficiently, ensuring cost-effective, flexible, and rapid execution while maintaining top-tier quality.",
    },
    {
      "title": "Full-Service Digital Transformation",
      "description":
          "From web & mobile app development to SaaS solutions and AI integration, we provide end-to-end digital services to help businesses scale and optimize operations.",
    },
    {
      "title": "Cost-Effective & High-Quality Service",
      "description":
          "Hiring an in-house tech team is expensive. We provide affordable yet high-performance solutions, reducing operational costs without compromising quality.",
    },
    {
      "title": "Long-Term Support & Continuous Improvement",
      "description":
          "Beyond development, we offer maintenance, optimization, and growth consulting, ensuring that your digital solutions evolve with market trends.",
    },
    {
      "title": "Security & Reliability",
      "description":
          "We prioritize data security, compliance, and system stability, ensuring trustworthy and high-performing digital products.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return SizedBox(
      width: double.infinity,
      // height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/choose.svg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 50,
                horizontal: isMobile ? 20 : 40,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMobile) ...[
                        Expanded(
                          child: Image.asset(
                            "assets/images/png/choose_us.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 30),
                      ],
                      Expanded(
                        child: _buildTextContent(isMobile),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "WHY CHOOSE US?",
          style: TextStyle(
            fontSize: isMobile ? 12 : 14,
            fontWeight: FontWeight.w600,
            color: Colors.blue.shade600,
            fontFamily: "Urbanist",
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "We bring solutions to make life easier.",
          style: TextStyle(
            fontSize: isMobile ? 22 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: "Urbanist",
          ),
        ),
        const SizedBox(height: 20),
        if (isMobile) ...[
          Image.asset(
            "assets/images/png/choose_us.png",
            width: 250,
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 30),
        ],
        // List item dengan accordion behavior
        ...List.generate(items.length, (index) {
          return _buildExpandableItem(
            title: items[index]['title']!,
            description: items[index]['description']!,
            index: index,
            isMobile: isMobile,
          );
        }),
      ],
    );
  }

  Widget _buildExpandableItem({
    required String title,
    required String description,
    required int index,
    required bool isMobile,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        initiallyExpanded: selectedIndex == index,
        onExpansionChanged: (expanded) {
          setState(() {
            selectedIndex = expanded ? index : null;
          });
        },
        title: Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: "Urbanist",
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16).copyWith(top: 0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                color: Colors.black54,
                height: 1.5,
                fontFamily: "Urbanist",
              ),
            ),
          ),
        ],
      ),
    );
  }
}