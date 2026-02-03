import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'onboard2_screen.dart';

class Onboard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF1483C2),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20,
              top: 726,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Onboard2()),
                  );
                },
                child: Container(
                  width: 335,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: const Color(0xFF2B2B2B),
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.28,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: -80,
              top: 220,
              child: Container(
                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.02),
                width: 560.80,
                height: 420.60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/image3.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 52,
              top: 682,
              child: Container(
                width: 179,
                height: 10.71,
                decoration: ShapeDecoration(
                  color: const Color(0x4C101010),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 78,
              top: 121,
              child: SizedBox(
                width: 219,
                child: Text(
                  'WELLCOME TO\nNIKE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFEBEBEB),
                    fontSize: 30,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 5,
              top: 582,
              child: SvgPicture.asset(
                'assets/images/onboard1.svg',
                width: 482.1,
                height: 166,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
