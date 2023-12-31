import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/resources/components/preview_revenue.dart';
import 'package:second_project/resources/components/vehicle/latest_order_wid.dart';
import 'package:second_project/resources/components/vehicle/trending_wid.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/text_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final data = getDashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          elevation: 0,
          title: Text('HOME', style: GoogleFonts.poppins()),
          centerTitle: true,
          backgroundColor: appbarColorH),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GridviewContainerWidget(
                      value: '₹ ${data.hostRevenue}',
                      title: 'Revenue Generated',
                    ),
                    GridviewContainerWidget(
                      value: '${data.bookedCount}',
                      title: 'Booking',
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GridviewContainerWidget(
                      value: '${data.completedCount}',
                      title: 'Completed',
                    ),
                    GridviewContainerWidget(
                      value: '${data.cancelledBooking}',
                      title: 'Cancelled',
                    ),
                  ],
                ),
                data.trending.isNotEmpty
                    ? const HindTextWidget(
                        isBold: true,
                        text: 'Trending',
                        size: 20,
                        color: Colors.black,
                        left: 0,
                        top: 10)
                    : const SizedBox(),
                data.trending.isNotEmpty
                    ? TrendingWid(data: data.trending[0])
                    : const SizedBox(),
                data.latestOrders.isNotEmpty
                    ? const HindTextWidget(
                        isBold: true,
                        text: 'Lastest Updates',
                        size: 20,
                        color: Colors.black,
                        left: 0,
                        top: 10)
                    : const SizedBox(),
                data.latestOrders.isNotEmpty
                    ? SizedBox(
                        child: LatestOrderWid(latesOrders: data.latestOrders))
                    : const SizedBox(),
                SizedBox(height: MediaQuery.sizeOf(context).height / 8)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
