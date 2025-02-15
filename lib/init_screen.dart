import 'package:flutter/material.dart';
import 'package:arus_digital_fix/screen/header/navbar.dart';
import 'package:arus_digital_fix/screen/about_us/our_service.dart';
import 'package:arus_digital_fix/screen/choose_us/choose_us_screen.dart';
import 'package:arus_digital_fix/screen/company/company_screen.dart';
import 'package:arus_digital_fix/screen/customer/customer_screen.dart';
import 'package:arus_digital_fix/screen/footer/footer.dart';
import 'package:arus_digital_fix/screen/hero/hero_screen.dart';
import 'package:arus_digital_fix/screen/projects/projects_screen.dart';
import 'package:arus_digital_fix/screen/stategy/our_strategy_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _ourServiceKey = GlobalKey(); // Key untuk OurServiceScreen

  void _scrollToOurService() {
    final context = _ourServiceKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const NavBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroScreen(scrollToOurService: _scrollToOurService), // Kirim fungsi scroll ke HeroScreen
            OurServiceScreen(key: _ourServiceKey), // Tandai OurServiceScreen dengan GlobalKey
            const OurStrategyScreen(),
            const ChooseUsScreen(),
            const CompanyScreen(),
            const ProjectsScreen(),
            const CustomerScreen(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}