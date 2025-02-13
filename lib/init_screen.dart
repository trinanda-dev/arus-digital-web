import 'package:arus_digital_fix/screen/company/company_screen.dart';
import 'package:arus_digital_fix/screen/customer/customer_screen.dart';
import 'package:arus_digital_fix/screen/footer/footer.dart';
import 'package:arus_digital_fix/screen/header/navbar.dart';
import 'package:arus_digital_fix/screen/about_us/our_service.dart';
import 'package:arus_digital_fix/screen/choose_us/choose_us_screen.dart';
import 'package:arus_digital_fix/screen/hero/hero_screen.dart';
import 'package:arus_digital_fix/screen/projects/projects_screen.dart';
import 'package:arus_digital_fix/screen/stategy/our_strategy_screen.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroScreen(),
            OurServiceScreen(),
            OurStrategyScreen(),
            ChooseUsScreen(),
            CompanyScreen(),
            ProjectsScreen(),
            CustomerScreen(),
            Footer()
          ],
        ),
      ) 
    );
  }
}