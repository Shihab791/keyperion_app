import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ক্লিপবোর্ডে কপি করার জন্য

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  // টেক্সট কপি করার জন্য হেল্পার ফাংশন
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // থিম ম্যাচিং ব্যাকগ্রাউন্ড
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Payment details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // মূল কন্টেন্ট স্ক্রোলভিউ
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    // ১. স্ট্রাইপ পেমেন্ট কার্ড (Stripe Payment Card)
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          // গোল লোগো ব্যাকগ্রাউন্ড (Stripe)
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                'stripe',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // টেক্সট এরিয়া
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Payment through stripe',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$950',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Pay Now বাটন
                          ElevatedButton(
                            onPressed: () {
                              // পেমেন্ট গেটওয়ে অ্যাকশন
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1A1A1A),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Pay now',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ব্যাংক ডিটেইলস হেডার টেক্সট
                    const Text(
                      'Bank details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ২. ব্যাংক অ্যাকাউন্ট কার্ড ১
                    _buildBankDetailCard(
                      context,
                      title: 'Account title',
                      holderName: 'Account holder name',
                      accountNumber: 'DE89 3704 0044 0532 0130 00',
                    ),

                    const SizedBox(height: 16),

                    // ৩. ব্যাংক অ্যাকাউন্ট কার্ড ২
                    _buildBankDetailCard(
                      context,
                      title: 'Account title',
                      holderName: 'Account holder name',
                      accountNumber: 'DE89 3704 0044 0532 0130 00',
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

  // ব্যাংক কার্ডের জন্য কাস্টম উইজেট বিল্ডার
  Widget _buildBankDetailCard(
      BuildContext context, {
        required String title,
        required String holderName,
        required String accountNumber,
      }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // কার্ডের উপরের অংশ (Title)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // ডিভাইডার লাইন
          Divider(height: 1, color: Colors.grey.shade100),

          // কার্ডের ভেতরের কন্টেন্ট (Holder Name ও Account Number)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // হোল্ডার নেম রো
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      holderName,
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                    IconButton(
                      icon: Icon(Icons.copy_rounded, size: 18, color: Colors.grey.shade400),
                      onPressed: () => _copyToClipboard(context, holderName),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // অ্যাকাউন্ট নাম্বার রো
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      accountNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.copy_rounded, size: 18, color: Colors.grey.shade400),
                      onPressed: () => _copyToClipboard(context, accountNumber),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}