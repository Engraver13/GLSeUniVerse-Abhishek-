// import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// class scanQr extends StatefulWidget {
//   const scanQr({super.key});

//   @override
//   State<scanQr> createState() => _scanQrState();
// }

// class _scanQrState extends State<scanQr> {
//   String qrResult = "Scan the Qr code";
//   Future<void> qrScan() async {
//     try {
//       final qrcode = await FlutterBarcodeScanner.scanBarcode(
//           "0xFF3F79EB", "cancel", true, ScanMode.QR);
//       if (!mounted) return;
//       setState(() {
//         qrResult = qrcode.toString();
//       });
//     } on PlatformException {
//       qrResult = "Failed to scan Qr code";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   qrScan();
//                   setState(() {});
//                 },
//                 child: Text("Scan Qr")),
//             SizedBox(
//               height: 30,
//             ),
//             Text(
//               qrResult,
//               style: TextStyle(fontSize: 25),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class QRCodeScannerScreen extends StatefulWidget {
  // const QRCodeScannerScreen({super.key});

  @override
  State<QRCodeScannerScreen> createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRView(
          key: qrKey,
          onQRViewCreated: (controller) {
            setState(() {
              this.controller = controller;
            });

            controller.scannedDataStream.listen((scanData) {
              print("Scan QR Code : $scanData");
            });
          }),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
