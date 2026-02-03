import 'package:flutter/material.dart';
import 'signin_screen.dart';

class Onboard3 extends StatelessWidget {
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
            // Imagen del zapato Air Jordan
            Positioned(
              left: 0,
              top: 60,
              right: 0,
              child: Center(
                child: Container(
                  width: 280,
                  height: 280,
                  child: Image.asset(
                    'assets/images/Aire Jordan Nike.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // Sombra del zapato
            Positioned(
              left: 98,
              top: 320,
              child: Container(
                width: 176,
                height: 6,
                decoration: ShapeDecoration(
                  color: const Color(0x42101010),
                  shape: OvalBorder(),
                ),
              ),
            ),
            // Texto principal
            Positioned(
              left: 30,
              top: 380,
              child: SizedBox(
                width: 315,
                child: Text(
                  'You Have The\nPower To',
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
              top: 490,
              child: SizedBox(
                width: 322,
                child: Text(
                  'There Are Many Beautiful And Attractive\nPlants To Your Room',
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
                    MaterialPageRoute(builder: (context) => SignIn()),
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
