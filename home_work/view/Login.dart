import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled/screen.dart';
import 'alert.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeWork1(),
  ));
}

class HomeWork1 extends StatefulWidget {
  const HomeWork1({super.key});

  @override
  State<HomeWork1> createState() => _HomeWork1State();
}
class _HomeWork1State extends State<HomeWork1> {
  final TextEditingController phoneController = TextEditingController();
  String? errorText;
  Timer? _time;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_onPhoneChanged);
  }

  @override
  void dispose() {
    phoneController.removeListener(_onPhoneChanged);
    phoneController.dispose();
    _time?.cancel();
    super.dispose();
  }

  void _onPhoneChanged() {
    if (_time?.isActive ?? false) _time!.cancel(); // Hủy timer nếu đang chạy
    _time = Timer(const Duration(seconds: 1), () {
      setState(() {
        String phoneNumber = phoneController.text.trim();

        if (phoneNumber.isEmpty) {
          errorText = null;
        } else if (!isValidNum(phoneNumber)) {
          errorText = "Your phone number is incorrect!";
        } else {
          errorText = null;
        }
      });
    });
  }


  bool isValidNum(String phoneNum) {
    final RegExp phoneReg = RegExp(r'^(?:\+84|0)([3|5|7|8|9])[0-9]{8}$');
    return phoneReg.hasMatch(phoneNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xDFDFDFDF),
        toolbarHeight: 50,
        title: const Text(
          'Sign in',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 50),
        child:
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your phone number",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Enter your phone number to sign in or sign up in this app",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Your phone number',
                  border: const OutlineInputBorder(),
                  errorText: errorText,
                ),
              ),
              SizedBox(
                height: 550,
              ),
              AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final phoneNumber = phoneController.text.trim();
                      String message = isValidNum(phoneNumber)
                          ? "Số điện thoại đúng định dạng"
                          : "Số điện thoại sai định dạng";

                      Alert.showAlert(context, message);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
