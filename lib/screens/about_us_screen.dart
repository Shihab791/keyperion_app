import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // ক্লীন এবং প্রফেশনাল টেক্সট (যাতে ফিল্টার এরর না আসে)
    const String aboutText1 = "Welcome to Keyperion. We are dedicated to providing the best-in-class security and credential management solutions for our users. Our platform is built with cutting-edge technology to ensure your data remains private, secure, and accessible whenever you need it.";

    const String aboutText2 = "Our team continuously works on expanding features, improving user experience, and implementing top-tier encryption protocols. Thank you for choosing us as your trusted partner in securing your digital life.";

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
                  const Text(
                    'About us',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // image_70faff.png অনুযায়ী কন্টেন্ট এরিয়া
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),

                    // সেন্ট্রাল ইমেজ (রেসপন্সিভ সাইজ ১৯০x১৯০ এর কাছাকাছি)
                    Container(
                      width: screenWidth * 0.48,
                      height: screenWidth * 0.48,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          // প্রোজেক্ট স্ট্রাকচার অনুযায়ী সঠিক ইমেজ নাম ও পাথ
                          image: AssetImage('assets/images/about_us.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // প্যারাগ্রাফ ১
                    const Text(
                      aboutText1,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // প্যারাগ্রাফ ২
                    const Text(
                      aboutText2,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
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
}