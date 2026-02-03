import 'package:flutter/material.dart';
import 'onboard3_screen.dart';

class Onboard2 extends StatelessWidget {
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
            // Imagen del zapato
            Positioned(
              left: 0,
              top: 80,
              right: 0,
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    'assets/images/Spring_prev_ui 1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // Sombra del zapato
            Positioned(
              left: 78,
              top: 340,
              child: Container(
                width: 218,
                height: 17,
                decoration: ShapeDecoration(
                  color: const Color(0x42101010),
                  shape: OvalBorder(),
                ),
              ),
            ),
            // Texto principal
            Positioned(
              left: 30,
              top: 400,
              child: SizedBox(
                width: 315,
                child: Text(
                  'Let\'s Start Journey\nWith Nike',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFEBEBEB),
                    fontSize: 34,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 1.30,
                  ),
                ),
              ),
            ),
            // Texto descriptivo
            Positioned(
              left: 27,
              top: 510,
              child: SizedBox(
                width: 322,
                child: Text(
                  'Smart, Gorgeous & Fashionable\nCollection Explor Now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFD8D8D8),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
              ),
            ),
            // Botón Next
            Positioned(
              left: 20,
              top: 726,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Onboard3()),
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
                      'Next',
                      style: TextStyle(
                        color: const Color(0xFF2B2B2B),
                        fontSize: 14,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
