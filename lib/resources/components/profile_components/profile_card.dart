import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/data/get_it/get_it.dart';
import 'package:second_project/resources/api_urls/host_url.dart';
import 'package:second_project/resources/constants/colors.dart';
import 'package:second_project/resources/constants/font_styles.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';
import 'package:second_project/view/profile/profile_edit.dart';
import 'package:shimmer/shimmer.dart';

class ProfileCardWid extends StatelessWidget {
  const ProfileCardWid({super.key});

  @override
  Widget build(BuildContext context) {
    final hostModelData = getLoggedInHost();
    double heigth = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
        color: mainColorH,
      ),
      padding: const EdgeInsets.all(10),
      height: heigth / 3.4,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "profilePhoto",
            child: hostModelData.profile.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: heigth / 7,
                        imageUrl:
                            "${HostUrl.imagegettingUrl}${hostModelData.profile}",
                        placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: shimmerbaseColor,
                              highlightColor: shimmerhighlightColor,
                              child: CircleAvatar(
                                backgroundColor: mainColorH,
                                radius: heigth / 13,
                                child: Image.network(url),
                              ),
                            )),
                  )
                : CircleAvatar(
                    backgroundColor: mainColorH,
                    radius: heigth / 13,
                    backgroundImage: AssetImage(image.profilePhotodemo)),
          ),
          const SizedBox(height: 10),
          Text(
            " ${hostModelData.name.toUpperCase()}",
            style: CustomFontStyles.profileName,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.8,
                child: Text(hostModelData.email,
                    style: CustomFontStyles.mailstyle,
                    overflow: TextOverflow.ellipsis),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfileEditScreen()));
                  },
                  child: Text(
                    "Edit Profile",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
