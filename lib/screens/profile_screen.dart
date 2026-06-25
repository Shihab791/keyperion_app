import 'package:flutter/material.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // প্রোফাইল পেজ সিলেক্টেড থাকার কারণে ইনডেক্স ৪ (সর্বশেষ আইকন)
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // ১. মূল কন্টেন্ট এরিয়া (স্ক্রোলযোগ্য)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),

                    // স্ক্রিন টাইটেল
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // প্রোফাইল পিকচার (আপনার দেওয়া AssetImage দিয়ে ফিক্সড করা)
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purple.shade50,
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          // 👇 আপনার লোকাল অ্যাসেট ফোল্ডার থেকে ছবি দেখানোর জন্য
                          backgroundImage: AssetImage('assets/images/profile.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // নাম এবং ইমেইল
                    const Text(
                      'Md. Abid Hasan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'example@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ইউনিট জয়েনিং স্ট্যাটাসカード
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.grey.shade100),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Unit',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'No unit joined',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1C1C1E),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              elevation: 0,
                            ),
                            child: const Text('Join', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // সেটিংস অপশনস লিস্ট
                    _buildSettingItem(
                      icon: Icons.person_outline_rounded,
                      title: 'Account settings',
                      subtitle: 'Edit your profile informations',
                    ),
                    _buildSettingItem(
                      icon: Icons.chat_bubble_outline_rounded,
                      title: 'Support',
                      subtitle: 'Facing any issue? Contact with platform admin',
                    ),
                    _buildSettingItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      subtitle: 'Change password, privacy policy, faq...',
                    ),
                    _buildSettingItem(
                      icon: Icons.delete_outline_rounded,
                      title: 'Delete account',
                      subtitle: 'Delete your account from Keyperion Living',
                      isDelete: true,
                    ),
                    _buildSettingItem(
                      icon: Icons.logout_rounded,
                      title: 'Logout',
                      subtitle: 'After logging out you have to login again with your credentials',
                      isLogout: true,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // ২. রেসপন্সিভ বটম নেভিগেশন বার (সবসময় স্ক্রিনের নিচে ফিক্সড থাকবে)
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

  // কাস্টম সেটিং রRow/Item উইজেট
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isDelete = false,
    bool isLogout = false,
  }) {
    Color iconBgColor = Colors.white;
    Color iconColor = Colors.grey.shade700;
    Color titleColor = Colors.black;

    if (isDelete) {
      titleColor = const Color(0xFFE15F5A);
    } else if (isLogout) {
      iconBgColor = const Color(0xFFE15F5A);
      iconColor = Colors.white;
      titleColor = const Color(0xFFE15F5A);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
if (title == 'Settings') {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SettingsScreen(),
    ),
  );
}
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              // আইকন কন্টেইনার
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                  border: isLogout ? null : Border.all(color: Colors.grey.shade100),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 16),

              // টেক্সট ইনফরমেশন
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),

              // ডান পাশের অ্যারো আইকন
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // রেসপন্সিভ বটম নেভিগেশন আইটেম বিল্ডার
  Widget _buildNavItem(int index, IconData icon) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1C1C1E) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey.shade600,
          size: 22,
        ),
      ),
    );
  }
}