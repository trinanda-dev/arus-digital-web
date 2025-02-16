import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768; // Cek tampilan mobile

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Text(
            "COMPANY FACTS",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade600,
              letterSpacing: 1.2,
              fontFamily: "Urbanist",
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "We are proud of our compact team",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: "Urbanist",
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Just sit back and relax while we take care of your business needs for you.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontFamily: "Urbanist",
            ),
          ),
          const SizedBox(height: 30),

          // Statistik Perusahaan (Responsif)
          isMobile ? _buildStatsColumn() : _buildStatsRow(),

          const SizedBox(height: 30),

          // Daftar Tim (Menggunakan Wrap untuk responsif dengan ukuran seragam)
          _buildTeamGrid(screenWidth),
        ],
      ),
    );
  }

  // Statistik Perusahaan dalam satu baris (Desktop)
  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CompanyStat(icon: Icons.check_circle_outline, number: "1000+", label: "Completed Projects"),
        SizedBox(width: 16),
        CompanyStat(icon: Icons.people_outline, number: "50K+", label: "Happy Customers"),
        SizedBox(width: 16),
        CompanyStat(icon: Icons.emoji_events_outlined, number: "20+", label: "Awards Won"),
      ],
    );
  }

  // Statistik Perusahaan dalam satu kolom (Mobile)
  Widget _buildStatsColumn() {
    return Column(
      children: const [
        CompanyStat(icon: Icons.check_circle_outline, number: "1000+", label: "Completed Projects"),
        SizedBox(height: 16),
        CompanyStat(icon: Icons.people_outline, number: "50K+", label: "Happy Customers"),
        SizedBox(height: 16),
        CompanyStat(icon: Icons.emoji_events_outlined, number: "20+", label: "Awards Won"),
      ],
    );
  }

  // GridView untuk daftar tim (Menggunakan Wrap dengan tinggi seragam)
  Widget _buildTeamGrid(double screenWidth) {
    return Align(
      alignment: Alignment.center, // Memusatkan konten
      child: IntrinsicHeight(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 16, // Spasi antar kartu
          runSpacing: 16, // Spasi antar baris
          children: const [
            TeamCard(
              name: "Ghora Laziola",
              role: "Chief Executive Officer",
              imagePath: "assets/images/png/Ghora.png",
              description: "Leads company strategy, decision-making, and business growth.",
            ),
            TeamCard(
              name: "Agsanshina Raka Syakti",
              role: "Chief Finance Officer",
              imagePath: "assets/images/png/Raka.png",
              description: "Manages financial planning, budgeting, and resource allocation.",
            ),
            TeamCard(
              name: "Tri Nanda",
              role: "Chief Mobile Officer",
              imagePath: "assets/images/png/Trinanda.png",
              description: "Oversees mobile app development and ensures product scalability.",
            ),
            TeamCard(
              name: "Syahri Ramadhan",
              role: "Chief Technology Officer",
              imagePath: "assets/images/png/Syahri.png",
              description: "Leads technology strategy, innovation, and software development.",
            ),
            TeamCard(
              name: "Aznul Khairi",
              role: "Graphic Designer",
              imagePath: "assets/images/png/Aznul.png",
              description: "Manages visual design, branding, and digital content creation for various platforms.",
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk Statistik Perusahaan
class CompanyStat extends StatelessWidget {
  final IconData icon;
  final String number;
  final String label;

  const CompanyStat({
    super.key,
    required this.icon,
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue.shade600),
        const SizedBox(height: 5),
        Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontFamily: "Urbanist",
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontFamily: "Urbanist",
          ),
        ),
      ],
    );
  }
}

// Widget untuk Kartu Tim dengan ukuran seragam
class TeamCard extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;
  final String description;

  const TeamCard({
    super.key,
    required this.name,
    required this.role,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, // Pastikan semua kartu memiliki lebar yang sama
      child: IntrinsicHeight(
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Membuat semua elemen sejajar
              children: [
                // Foto Profil
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(imagePath),
                ),
                const SizedBox(height: 20),

                // Nama dan Role
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: "Urbanist",
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontFamily: "Urbanist",
                  ),
                ),
                const SizedBox(height: 10),

                // Deskripsi Singkat
                Expanded(
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: "Urbanist",
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Ikon Sosial Media
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Aksi ketika tombol ditekan
                      },
                      child: Image.asset(
                        "assets/images/png/linkin.png", // Path gambar
                        width: 30, // Atur ukuran gambar
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}