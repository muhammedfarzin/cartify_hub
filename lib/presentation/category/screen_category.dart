import 'package:cartify_hub/presentation/widgets/rounded_box_with_text.dart';
import 'package:flutter/material.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final columnCount = screenWidth ~/ 180;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columnCount,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Image.network(
                        "https://image01.realme.net/general/20230512/1683873789325.png.webp?width=1440&height=1440&size=656747",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: RoundedBoxWithText(
                        text: "SmartPhones",
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
