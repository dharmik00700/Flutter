import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

class ZeptoOtpScreen extends StatefulWidget {
  final String phoneNumber;
  const ZeptoOtpScreen({super.key, required this.phoneNumber});

  @override
  State<ZeptoOtpScreen> createState() => _ZeptoOtpScreenState();
}

class _ZeptoOtpScreenState extends State<ZeptoOtpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  Timer? _timer;
  int _remainingSeconds = 30;
  bool _isResendVisible = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _remainingSeconds = 30;
      _isResendVisible = false;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        setState(() {
          _isResendVisible = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  void _verifyOtp() {
    String otp = _otpControllers.map((e) => e.text).join();
    if (otp.length == 6) {
      // Mock validation logic
      if (otp == "123456") {
        // Close keyboard
        FocusScope.of(context).unfocus();
        
        // Navigate to Main Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ZeptoMainScreen()),
        );
      } else {
        // Show Error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid OTP. Please enter 123456'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter 6 digit OTP'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 2),
          ),
        );
    }
  }

  void _onOtpChanged(String value, int index) {
    // Move focus to next field if a digit is entered
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    // Move focus to previous field if backspace is pressed on empty field
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    // Auto-verify when 6 digits are filled is optional if we have a button, 
    // but keeping it for better UX.
    String otp = _otpControllers.map((e) => e.text).join();
    if (otp.length == 6) {
      _verifyOtp();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    // Helper to scale font size based on screen width
    double getFontSize(double size) => size * (width / 375.0);

    return Scaffold(
      backgroundColor: const Color(0xFF320E47),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                Text(
                  'OTP\nVerification',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getFontSize(32),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'OTP has been sent to +91 ${widget.phoneNumber}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getFontSize(16),
                  ),
                ),
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) => Container(
                      width: width * 0.12,
                      height: width * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50), // Circular shape
                      ),
                      child: TextField(
                        controller: _otpControllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        onChanged: (value) => _onOtpChanged(value, index),
                        style: TextStyle(
                          fontSize: getFontSize(20),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                // Timer / Resend Logic
                if (!_isResendVisible)
                  Center(
                    child: Text(
                      '00 : ${_remainingSeconds.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getFontSize(18),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                else
                  Column(
                    children: [
                      Center(
                        child: Text(
                          "Didn't get it?",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: getFontSize(14),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _startTimer();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('OTP Resent!')),
                            );
                          },
                          child: Text(
                            'ReSend OTP(SMS)',
                            style: TextStyle(
                              color: const Color(0xFFFF3D6E),
                              fontWeight: FontWeight.bold,
                              fontSize: getFontSize(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: height * 0.05),
                // Verify Button
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
                    onPressed: _verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: getFontSize(16),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
