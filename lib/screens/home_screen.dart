import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // আপনার দেওয়া SVG কোড
  final String svgAddress = '''
<svg width="188" height="188" viewBox="0 0 188 188" fill="none"
xmlns="http://www.w3.org/2000/svg">
<g opacity="0.6">
<path d="M114.642 74.3599L114.695 150.015H114.642V74.3599Z" fill="#C9C9C9"/>
<path d="M129.03 101.203H167.708V127.787H129.03V101.203Z" fill="#C9C9C9"/>
<path d="M114.692 150.027H114.639L82.2001 150.053H47.9106L15.4953 150.08L15.4189 80.3318V73.5755L65.0539 30.2562L114.639 73.5227V74.3745L114.692 150.027Z" fill="#EDEDED"/>
<path d="M187.997 71.7191V78.4225H120.285L115.617 74.3746L114.639 73.5227L65.0539 30.2563L15.4189 73.5756L7.68156 80.3319L0 71.7191L65.0539 14.993L130.111 71.7191H187.997Z" fill="#E15F5A"/>
<path d="M0 150.065H188V170.772H0V150.065Z" fill="#C9C9C9"/>
<circle cx="65" cy="57" r="10" fill="#EBC25D"/>
</g>
</svg>
''';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // ১. প্রধান স্ক্রোলযোগ্য কন্টেন্ট এরিয়া (এটি সম্পূর্ণ বাকি জায়গা দখল করবে)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),

                    // প্রোফাইল হেডার
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.purple.shade100,
                          backgroundImage: const AssetImage(
                            'assets/images/profile.png',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Md. Abid Hasan',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              Text(
                                'example@gmail.com',
                                style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Icon(Icons.notifications_none_outlined, color: Colors.grey.shade800, size: 22),
                        ),
                      ],
                    ),

                    // রেসপন্সিভ হাইট ম্যানেজমেন্ট
                    SizedBox(height: screenSize.height * 0.15),

                    // নো ইউনিট জয়েনড সেকশন
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 160,
                            height: 160,
                            child: SvgPicture.string(
                              svgAddress,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'No unit joined',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Join a unit to see the details here',
                            style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: screenSize.width * 0.55,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1C1C1E),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                                elevation: 0,
                              ),
                              child: const Text('Join unit', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // ২. কাস্টম বটম নেভিগেশন বার (এখন Column-এর নিচে থাকায় সবসময় স্ক্রিনের নিচে থাকবে)
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0, top: 8.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(0, Icons.home_filled),
                    _buildNavItem(1, Icons.build_outlined),
                    _buildNavItem(2, Icons.chat_bubble_outline),
                    _buildNavItem(3, Icons.calendar_month_outlined),
                    _buildNavItem(4, Icons.person_outline),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });

        if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        }
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1C1C1E)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected
              ? Colors.white
              : Colors.grey.shade600,
          size: 22,
        ),
      ),
    );
  }
}