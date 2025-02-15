import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.1), // Shadow tidak gelap
      toolbarHeight: 70,
      titleSpacing: 16,
      automaticallyImplyLeading: false,
      title: Image.asset(
        'assets/images/png/ads_logo.png',
        height: 100,
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
          color: Colors.black54,
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