import 'package:flutter/material.dart';

class BottomInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: const Color.fromRGBO(7, 41, 71, 1)),
          child: SizedBox(
            height: 104,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.33,
                        child: Center(
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              '+385 1 482 1111',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.34,
                        child: Image.asset(
                          'assets/franklin_logo.png',
                          width: MediaQuery.of(context).size.height * 0.34,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.33,
                        child: Center(
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              'info@franklin.hr',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/instagram_icon.png',
                              height: 36,
                              width: 36,
                              fit: BoxFit.cover,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                '  ' + 'franklin_nekretnine',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/web_icon.png',
                              height: 36,
                              width: 36,
                              fit: BoxFit.cover,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                '  ' + 'franklin.hr',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/facebook_icon.png',
                              height: 36,
                              width: 36,
                              fit: BoxFit.cover,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: Text(
                                '  ' + 'Franklin Nekretnine',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
