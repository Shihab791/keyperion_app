import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // স্ক্রিনের সাইজ অনুযায়ী ইমেজ ও টেক্সট রেসপন্সিভ করার জন্য MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;

    // অ্যাপের প্রাইভেসি পলিসি টেক্সট (এখানে আপনার আসল পলিসি বসিয়ে নিতে পারবেন)
    const String firstParagraph = "Welcome to our Privacy Policy page. We value your privacy and are committed to protecting your personal data. This policy explains how we collect, use, and safeguard your information when you use our application. Please read this carefully to understand our practices regarding your data.";

    const String secondParagraph = "We ensure that your account information, passwords, and security data are fully encrypted and never shared with third parties without your explicit consent. Our team continuously updates our system to maintain the highest level of security and compliance with global data protection regulations.";

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // Settings স্ক্রিনের সাথে মিল রেখে ব্যাকগ্রাউন্ড
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
                    'Privacy policy',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // কন্টেন্ট এরিয়া (স্ক্রোলযোগ্য এবং রেসপন্সিভ)
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),

                    // সেন্ট্রাল ইলাস্ট্রেশন/ইমেজ
                    Container(
                      width: screenWidth * 0.45, // স্ক্রিনের উইথ অনুযায়ী সাইজ এডজাস্ট হবে
                      height: screenWidth * 0.45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          // image_c9c2a0.png অনুযায়ী আপনার ফোল্ডারে থাকা password.jpg বা অন্য ইমেজ দিন
                          image: AssetImage('assets/images/password.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // প্যারাগ্রাফ ১
                    const Text(
                      firstParagraph,
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
                      secondParagraph,
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