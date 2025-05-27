import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:scan/scan.dart';
import 'package:virtual_exchange/Providers/providers.dart';

class QRViewPage extends StatefulWidget {
  const QRViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // ScanController controller = ScanController();
  @override
  void dispose() {
    // controller.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan Qr Code",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // child: ScanView(
            //   controller: controller,
            //   scanAreaScale: .7,
            //   scanLineColor: Colors.green.shade400,
            //   onCapture: (data) {
              // },
            // ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                        // color: Colors.teal,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(.5),
                            child: IconButton(
                                onPressed: () async {
                                  // controller.toggleTorchMode();
                                  setState(() {});
                                },
                                icon: const Icon(Icons.flash_on)),
                          ).paddingAll(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () async {},
                                  icon: Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.qrcode_viewfinder,
                                        color: themeProvider.darkMode ? Colors.white : Colors.black,
                                      ),
                                      Text("Receive", style: Theme.of(context).textTheme.bodySmall),
                                    ],
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    // controller?.pauseCamera();
                                    qrProvider.getGalleryImage();
                                  },
                                  icon: Column(
                                    children: [
                                      Icon(
                                        CupertinoIcons.photo,
                                        color: themeProvider.darkMode ? Colors.white : Colors.black,
                                      ),
                                      Text("Photo", style: Theme.of(context).textTheme.bodySmall),
                                    ],
                                  )),
                            ],
                          ).paddingOnly(bottom: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
