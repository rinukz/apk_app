import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    title: 'Rinukz CashFlow',
    debugShowCheckedModeBanner: false,
    home: RinukzCashFlowApp(),
  ));
}

class RinukzCashFlowApp extends StatefulWidget {
  const RinukzCashFlowApp({super.key});

  @override
  State<RinukzCashFlowApp> createState() => _RinukzCashFlowAppState();
}

class _RinukzCashFlowAppState extends State<RinukzCashFlowApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // เปิด JS ให้ระบบบัญชีทำงานได้
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            // เมื่อโหลดเสร็จ อาจจะใส่คำสั่งเพิ่มเติมตรงนี้ได้
          },
        ),
      )
      ..loadRequest(Uri.parse('https://script.google.com/macros/s/AKfycbxhSfY4siLJe5fNUHGUZpLSufOSc0sbWe7tjeAhPCb9oT-B8KJQ7YbJ_bc-t50kceWH/exec'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ใช้ SafeArea เพื่อไม่ให้เนื้อหาไปทับแถบสถานะด้านบน
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}