import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // স্ক্রিনের উইথ অনুযায়ী ইমেজ রেসপন্সিভ করার জন্য MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;

    // টার্মস অ্যান্ড কন্ডিশনের টেক্সট ভ্যারিয়েবল
    const String termsText1 = "Welcome to Keyperion. By accessing or using our application, you agree to be bound by these Terms & Conditions. Please read them carefully. If you do not agree with any part of these terms, you must not use our services.";

    const String termsText2 = "You are responsible for maintaining the confidentiality of your account credentials and password. Any activity under your account is your sole responsibility. We reserve the right to terminate accounts, remove content, or cancel services at our discretion if any violations occur.";

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // সেটিংসের সাথে ম্যাচিং ব্যাকগ্রাউন্ড
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
                    'Terms & Conditions',
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
                      width: screenWidth * 0.45, // স্ক্রিনের সাইজ অনুযায়ী এডজাস্ট হবে
                      height: screenWidth * 0.45,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          // আপনার ফোল্ডারে থাকা সঠিক ইমেজ পাথটি দিন
                          image: AssetImage('assets/images/terms.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // প্যারাগ্রাফ ১
                    const Text(
                      termsText1,
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
                      termsText2,
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