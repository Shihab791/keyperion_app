import 'package:flutter/material.dart';
import 'change_password_screen.dart';
import 'privacy_policy_screen.dart';
import 'terms_and_conditions_screen.dart';
import 'faq_screen.dart';
import 'about_us_screen.dart';
import 'payment_details_screen.dart';

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
                      onTap: () => Navigator.pop(context),
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
                    _buildSettingsTile(
                      context,
                      icon: Icons.key_outlined,
                      title: 'Change password',
                      subtitle: 'Change your account password',
                      isChangePassword: true,
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.credit_card_outlined,
                      title: 'Payment settings',
                      subtitle: 'Manage your payment settings',
                      isPayment: true,
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.info_outline_rounded,
                      title: 'About us',
                      subtitle: 'See our about us here',
                      isAboutUs: true,
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.shield_outlined,
                      title: 'Privacy policy',
                      subtitle: 'See our privacy policy here',
                      isPrivacyPolicy: true,
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.menu_book_outlined,
                      title: 'Terms & Conditions',
                      subtitle: 'See our terms & conditions here',
                      isTerms: true,
                    ),
                    _buildSettingsTile(
                      context,
                      icon: Icons.help_outline_rounded,
                      title: 'FAQ',
                      subtitle: 'See frequently asked questions here',
                      isFaq: true,
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
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        bool isChangePassword = false,
        bool isPrivacyPolicy = false,
        bool isTerms = false,
        bool isFaq = false,
        bool isAboutUs = false,
        bool isPayment = false,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          if (isChangePassword) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
            );
          } else if (isPrivacyPolicy) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
            );
          } else if (isTerms) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TermsAndConditionsScreen()),
            );
          }
          else if (isFaq) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FaqScreen()),
            );
          }
          else if (isAboutUs) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutUsScreen()),
            );
          }
          else if (isPayment) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentDetailsScreen()),
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