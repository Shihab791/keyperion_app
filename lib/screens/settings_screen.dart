import 'package:flutter/material.dart';
import 'change_password_screen.dart'; // 👈 চেঞ্জ পাসওয়ার্ড স্ক্রিনটি ইম্পোর্ট করা আছে

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            // কাস্টম অ্যাপ বার (ব্যাক বাটন এবং টাইটেল)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // ব্যাক বাটন
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context), // আগের পেজে ফিরে যাওয়ার জন্য
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  // স্ক্রিন টাইটেল
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // সেটিংস অপশনস লিস্ট (স্ক্রোলযোগ্য)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // 👈 এখানে context এবং ইভেন্ট ট্রিগার পাস করা হয়েছে
                    _buildSettingsTile(
                      context,
                      icon: Icons.key_outlined,
                      title: 'Change password',
                      subtitle: 'Change your account password',
                      isChangePassword: true, // এটি চেঞ্জ পাসওয়ার্ড পেজ ওপেন করবে
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.credit_card_outlined,
                      title: 'Payment settings',
                      subtitle: 'Manage your payment settings',
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.info_outline_rounded,
                      title: 'About us',
                      subtitle: 'See our about us here',
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.shield_outlined,
                      title: 'Privacy policy',
                      subtitle: 'See our privacy policy here',
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.menu_book_outlined,
                      title: 'Terms & Conditions',
                      subtitle: 'See our terms & conditions here',
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.help_outline_rounded,
                      title: 'FAQ',
                      subtitle: 'See frequently asked questions here',
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // কাস্টম সেটিংস লিস্ট টাইল বিল্ডার (ফিক্সড ও আপডেটেড)
  Widget _buildSettingsTile(
      BuildContext context, { // 👈 নেভিগেশনের জন্য context যুক্ত করা হয়েছে
        required IconData icon,
        required String title,
        required String subtitle,
        bool isChangePassword = false, // 👈 নতুন প্যারামিটার
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          // 👈 যদি চেঞ্জ পাসওয়ার্ড অপশনে ক্লিক করা হয়, তবে পাসওয়ার্ড স্ক্রিন ওপেন হবে
          if (isChangePassword) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
            );
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              // আইকন কন্টেইনার (হুবху গোল এবং সাদা ব্যাকগ্রাউন্ড)
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.grey.shade700, size: 22),
              ),
              const SizedBox(width: 16),

              // টেক্সট ইনফরমেশন
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
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
}