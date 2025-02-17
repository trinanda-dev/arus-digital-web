import 'dart:ui'; // Untuk efek blur
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100), // Efek blur kaca
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.1), // Semi transparan
          elevation: 0,
          toolbarHeight: 70,
          titleSpacing: 16,
          automaticallyImplyLeading: false,
          title: Image.asset(
            'assets/images/png/ads_logo.png',
            height: 50, // Sesuaikan ukuran logo
          ),
          actions: [
            if (isMobile)
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black54),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              )
            else
              Row(
                children: [
                  _navItem('Solusi Kami'),
                  const SizedBox(width: 20),
                  _contactButton(),
                  const SizedBox(width: 16),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title,
        style: GoogleFonts.urbanist(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _contactButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
      ),
      child: Text(
        'Contact',
        style: GoogleFonts.urbanist(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}