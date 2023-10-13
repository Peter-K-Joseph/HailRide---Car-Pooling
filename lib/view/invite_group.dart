import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InviteToGroup extends StatelessWidget {
  final String group;
  const InviteToGroup({Key? key, required this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invite to $group"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset(
                    "assets/animation_invite.json",
                    animate: true,
                  ),
                  Center(
                    child: CustomPaint(
                      size:
                          Size.square(MediaQuery.of(context).size.width * 0.45),
                      painter: QrPainter(
                        data:
                            "https://endpoint.nuvie.in/studentconnect/christuniversity.in/$group",
                        version: QrVersions.auto,
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: Color(0xff403F4C),
                        ),
                        gapless: true,
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.square,
                          color: Color(0xff403F4C),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                "Searching for available peers",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Your group $group is now available for discovery. Nearby peers will be able to see your group and request to join.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
