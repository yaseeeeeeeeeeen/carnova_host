import 'package:flutter/material.dart';
import 'package:second_project/user_side/modals/vehicle_data._modal.dart';
import 'package:second_project/user_side/resources/components/car_show_screen/car_book_bar.dart';
import 'package:second_project/user_side/resources/components/car_show_screen/car_details_card.dart';
import 'package:second_project/user_side/resources/components/car_show_screen/vehicle_images_wid.dart';
import 'package:second_project/user_side/resources/components/title_text_wid.dart';
import 'package:second_project/user_side/utils/appbar.dart';

// ignore: must_be_immutable
class CarDataShow extends StatelessWidget {
  CarDataShow({super.key, required this.vehicleData});
  VehicleDataModal vehicleData;
  @override
  Widget build(BuildContext context) {
    List<String> cardetails = [
      vehicleData.brand,
      vehicleData.fuel,
      vehicleData.transmission,
      vehicleData.rating.abs().toString()
    ];
    double heigth = MediaQuery.sizeOf(context).height;
    return Scaffold(
      bottomNavigationBar: CarDataBottomBar(price: vehicleData.price),
      appBar: customAppBarText(vehicleData.name, context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: vehicleData.name,
                child: Container(
                    height: heigth / 3.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(vehicleData.images[0]),
                            fit: BoxFit.cover)))),
            const SizedBox(height: 5),
            HomeTitles(titles: "Car Details"),
            CarDetailsCard(cardetails: cardetails),
            HomeTitles(titles: "More Images"),
            CarMoreImages(images: vehicleData.images)
          ],
        ),
      ),
    );
  }
}
