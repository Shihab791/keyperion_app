import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // FAQ এর ডামি ডেটা লিস্ট (লুপ ঘুরিয়ে কোড ছোট রাখার জন্য)
    final List<Map<String, String>> faqList = [
      {
        "question": "Question goes here",
        "answer": "Lorem ipsum dolor sit amet consectetur. Neque arcu velit fusce porttitor tellus consectetur justo pharetra a. Malesuada dignissim eu amet tristique faucibus pellentesque."
      },
      {
        "question": "Question goes here",
        "answer": "Lorem ipsum dolor sit amet consectetur. Neque arcu velit fusce porttitor tellus consectetur justo pharetra a. Malesuada dignissim eu amet tristique faucibus pellentesque."
      },
      {
        "question": "Question goes here",
        "answer": "Lorem ipsum dolor sit amet consectetur. Neque arcu velit fusce porttitor tellus consectetur justo pharetra a. Malesuada dignissim eu amet tristique faucibus pellentesque."
      },
      {
        "question": "Question goes here",
        "answer": "Lorem ipsum dolor sit amet consectetur. Neque arcu velit fusce porttitor tellus consectetur justo pharetra a. Malesuada dignissim eu amet tristique faucibus pellentesque."
      },
      {
        "question": "Question goes here",
        "answer": "Lorem ipsum dolor sit amet consectetur. Neque arcu velit fusce porttitor tellus consectetur justo pharetra a. Malesuada dignissim eu amet tristique faucibus pellentesque."
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // থিম অনুযায়ী ব্যাকগ্রাউন্ড
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
                    'FAQ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // কন্টেন্ট লিস্ট
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    // সেন্ট্রাল FAQ ইমেজ (রেসপন্সিভ সাইজ)
                    Container(
                      width: screenWidth * 0.45,
                      height: screenWidth * 0.40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          // image_c9c2a0.png তে থাকা আপনার support.jpg ইমেজটি ব্যবহার করা হয়েছে
                          image: AssetImage('assets/images/faq.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // FAQ এক্সপ্যান্ডেবল লিস্ট বিল্ডার
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: faqList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Theme(
                            // ExpansionTile এর ডিফল্ট বর্ডার ও ডিভাইডার রিমুভ করার জন্য
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ExpansionTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                collapsedShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Text(
                                  faqList[index]["question"]!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                // ডিজাইন অনুযায়ী প্লাস এবং মাইনাস আইকন কাস্টমাইজেশন
                                trailing: Builder(
                                    builder: (context) {
                                      final exp = ExpansionTileController.of(context);
                                      return Icon(
                                        exp.isExpanded
                                            ? Icons.remove_rounded
                                            : Icons.add_rounded,
                                        color: Colors.grey.shade600,
                                        size: 20,
                                      );
                                    }
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      bottom: 16.0,
                                    ),
                                    child: Text(
                                      faqList[index]["answer"]!,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade600,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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