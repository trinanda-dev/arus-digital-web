import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // FAQ Header
              Text(
                "FAQ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue.shade600,
                  letterSpacing: 1.2,
                  fontFamily: "Urbanist",
                ),
              ),
              const SizedBox(height: 10),

              // Layout Grid FAQ
              _buildFaqLayout(isMobile),
            ],
          ),
        ),

        // Footer
        const Footer(),
      ],
    );
  }

  Widget _buildFaqLayout(bool isMobile) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildFaqText(), // Bagian teks di atas
          const SizedBox(height: 20),
          _buildFaqList(), // Bagian daftar FAQ di bawah
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: _buildFaqText(),
          ),
          const SizedBox(width: 50), // Spasi antara teks dan FAQ List
          Expanded(
            flex: 4,
            child: _buildFaqList(),
          ),
        ],
      );
    }
  }

  // Widget teks di sebelah kiri
  Widget _buildFaqText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "If you don’t see an answer to your question, you can send us an email from our contact form.",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: "Urbanist",
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Still have questions? Feel free to reach out to us through our contact form. Our team is here to help with any inquiries, whether it's about pricing, subscriptions, or technical issues.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontFamily: "Urbanist",
            ),
          ),
          const SizedBox(height: 20),

          // Tombol All FAQ
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
            ),
            child: const Text(
              "All FAQ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Urbanist",
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget daftar FAQ di sebelah kanan
  Widget _buildFaqList() {
    return Column(
      children: [
        _faqTile("How can I request a custom software development service?"),
        _faqTile("What technologies does Arus Digital specialize in?"),
        _faqTile("Does Arus Digital provide ongoing maintenance and support?"),
        _faqTile("How long does it take to develop a web or mobile application?"),
        _faqTile("What is the cost estimation for a software project?"),
        _faqTile("Can Arus Digital integrate AI and machine learning into my project?"),
        _faqTile("Does Arus Digital offer UI/UX design services?"),
        _faqTile("How does Arus Digital ensure data security in software development?"),
      ],
    );
  }

  // Widget FAQ Tile (ExpansionTile)
  Widget _faqTile(String question) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            fontFamily: "Urbanist",
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "",
              style: TextStyle(
                fontSize: 14, 
                color: Colors.black54,
                fontFamily: "Urbanist",
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Widget Footer dengan SVG Background
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/footer.svg', // Sesuaikan path dengan asset kamu
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}