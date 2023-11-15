import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/user_side/resources/components/car_show_screen/review_tile.dart';
import 'package:second_project/user_side/resources/constant/colors_userside.dart';
import 'package:second_project/user_side/resources/constant/text_styles.dart';

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({super.key, required this.cardetails});
  final List cardetails;
  @override
  Widget build(BuildContext context) {
    List<String> svgPath = [
      "assets/svg/car-steering-wheel-svgrepo-com.svg",
      "assets/svg/fuel-svgrepo-com.svg",
      "assets/svg/gearshift-gear-svgrepo-com.svg",
      "assets/svg/star-svgrepo-com.svg"
    ];
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          if (index == cardetails.length - 1) {
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      color: appbarColorU,
                      height: MediaQuery.sizeOf(context).height / 2,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Text("Reviews", style: reviweTitle),
                            const ReviewCommentTile(
                                review: "its very friendly to use",
                                rating: "4.5"),
                            const ReviewCommentTile(
                                review: "Good coundition", rating: "4.2"),
                            const ReviewCommentTile(
                                review: "i feel some clutch problems",
                                rating: "2.5"),
                            const ReviewCommentTile(
                                review: "its very friendly to use",
                                rating: "4.5"),
                            const ReviewCommentTile(
                                review: "Good coundition", rating: "4.2"),
                            const ReviewCommentTile(
                                review: "i feel some clutch problems",
                                rating: "2.5"),
                            const ReviewCommentTile(
                                review: "its very friendly to use",
                                rating: "4.5"),
                            const ReviewCommentTile(
                                review: "Good coundition", rating: "4.2"),
                            const ReviewCommentTile(
                                review: "i feel some clutch problems",
                                rating: "2.5")
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                  margin: const EdgeInsets.all(2),
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appbarColorU),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(svgPath[index],
                                fit: BoxFit.cover, height: 40, width: 40),
                            Text(cardetails[index], style: style7)
                          ],
                        ),
                        Text("Rating", style: style4)
                      ],
                    ),
                  )),
            );
          } else {
            return Container(
              margin: const EdgeInsets.all(2),
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withOpacity(0.2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(svgPath[index],
                      height: 50, width: 50, fit: BoxFit.cover),
                  const SizedBox(height: 5),
                  Text(cardetails[index], style: style5)
                ],
              ),
            );
          }
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cardetails.length,
      ),
    );
  }
}