import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeroScreen extends StatefulWidget {
  final VoidCallback scrollToOurService; // Callback untuk scroll

  const HeroScreen({super.key, required this.scrollToOurService});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.83,
      width: double.infinity,
      child: Stack(
        children: [
          // Background SVG
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/vector.svg',
              fit: BoxFit.cover,
            ),
          ),

          // Floating Icons (Ikon yang bergerak naik turun)
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned(
                    top: screenHeight * 0.15 + _animation.value,
                    left: screenWidth * 0.1,
                    child: FloatingIcon(icon: Icons.android, color: Colors.blue),
                  ),
                  Positioned(
                    top: screenHeight * 0.3 - _animation.value,
                    right: screenWidth * 0.12,
                    child: FloatingIcon(icon: Icons.apple, color: Colors.blue),
                  ),
                  Positioned(
                    bottom: screenHeight * 0.1 + _animation.value,
                    left: screenWidth * 0.4,
                    child: FloatingIcon(icon: Icons.code, color: Colors.blueAccent),
                  ),
                  Positioned(
                    top: screenHeight * 0.05 + _animation.value,
                    left: screenWidth * 0.5,
                    child: FloatingIcon(icon: Icons.memory, color: Colors.deepPurpleAccent), // AI/Machine Learning
                  ),
                ],
              );
            },
          ),

          // Konten utama
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "We build digital solutions to empower",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Urbanist",
                    ),
                  ),
                  const Text(
                    "entrepreneurs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontFamily: "Urbanist",
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Bridge the Solution: Unlocking the power of digital innovation.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontFamily: "Urbanist",
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: widget.scrollToOurService, // Gunakan fungsi scroll dari InitScreen
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      "Explore Our Services",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget khusus untuk ikon mengambang
class FloatingIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const FloatingIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Icon(icon, size: 32, color: color),
    );
  }
}
