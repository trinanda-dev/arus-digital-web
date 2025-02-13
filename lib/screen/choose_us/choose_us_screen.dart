import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ChooseUsScreen extends StatelessWidget {
  const ChooseUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Stack(
        children: [
          // Background SVG
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/images/choose.svg', // Sesuaikan path sesuai lokasi file SVG
              fit: BoxFit.cover, // Pastikan gambar mengisi seluruh area
            ),
          ),

          // Konten di atas background
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Pilih Kami",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Kami menyediakan berbagai layanan digital yang inovatif.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
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