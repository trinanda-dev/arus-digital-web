import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4, // HeroSection setinggi 90% layar
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
          ),
          Positioned(
            bottom: 0, // Pastikan gelombang tetap di bawah
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/footer.svg', // Pastikan file SVG ada di folder assets
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}