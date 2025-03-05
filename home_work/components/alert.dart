// custom_alert.dart
import 'package:flutter/material.dart';
import 'screen.dart'; // Import màn hình Screen vào

class Alert {
  static void showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng alert
                if (message == "Số điện thoại đúng định dạng") {
                  // Chỉ điều hướng khi nhập đúng số điện thoại
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeWork2(),
                    ),
                  );
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
