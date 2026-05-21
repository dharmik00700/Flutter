import 'package:flutter/material.dart';
import 'Zepto_otp_screen.dart';

class ZeptoLoginScreen extends StatefulWidget {
  const ZeptoLoginScreen({super.key});

  @override
  State<ZeptoLoginScreen> createState() => _ZeptoLoginScreenState();
}

class _ZeptoLoginScreenState extends State<ZeptoLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final RegExp phoneRegExp = RegExp(r'^[6-9]\d{9}$');

    // Helper to scale font size based on screen width
    double getFontSize(double size) => size * (width / 375.0);

    return Scaffold(
      backgroundColor: const Color(0xFF320E47),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.05),
                          // Zepto Logo
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [
                                Color(0xFFFF3D6E), // Pink
                                Color(0xFFFF9E5E), // Orange
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ).createShader(bounds),
                            child: Text(
                              'zepto',
                              style: TextStyle(
                                fontSize: getFontSize(40),
                                fontWeight: FontWeight.bold,
                                letterSpacing: -1.0,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.04),
                          // Headline
                          Text(
                            'Groceries\ndelivered in\n10 minutes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getFontSize(36),
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          // Phone Number Input
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '+91',
                                  style: TextStyle(
                                    fontSize: getFontSize(16),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextFormField(
                                    controller: _phoneController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a phone number';
                                      } else if (!phoneRegExp.hasMatch(value)) {
                                        return 'Please enter a valid phone number';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.phone,
                                    style: TextStyle(fontSize: getFontSize(16)),
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Phone Number',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.025),
                          // Continue Button
                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFF3D6E), // Pink
                                  Color(0xFFFF9E5E), // Orange
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ZeptoOtpScreen(
                                        phoneNumber: _phoneController.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                  fontSize: getFontSize(16),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(height: height * 0.02),
                          // Terms and Privacy
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'By continuing, you agree to our\n',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: getFontSize(12),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: TextStyle(
                                      color: const Color(0xFFFF3D6E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: getFontSize(12),
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' & ',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: getFontSize(12),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      color: const Color(0xFFFF3D6E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: getFontSize(12),
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
