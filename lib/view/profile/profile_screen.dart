import 'package:flutter/material.dart';
import 'package:second_project/modals/host_data_modal.dart';
import 'package:second_project/resources/api_urls/host_url.dart';

import 'package:second_project/resources/components/list_tile.dart';

import 'package:second_project/resources/constants/text_styles.dart';
import 'package:second_project/utils/logout_confirm.dart';
import 'package:second_project/utils/appbar.dart';
import 'package:second_project/view/login_and_signup/login_screen.dart';
import 'package:second_project/view/profile/profile_edit.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  bool profileimage = false;

  @override
  Widget build(BuildContext context) {
    if (hostModelData?.profile == null) {
      profileimage = false;
    } else {
      profileimage = true;
    }
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: customAppBarH('PROFILE'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    height: height / 4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken),
                            image: AssetImage(image.appLogo),
                            fit: BoxFit.cover),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 55,
                          child: Hero(
                            tag: "profilePhoto",
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              backgroundImage: hostModelData!.profile.isNotEmpty
                                  ? NetworkImage(
                                      '${HostUrl.baseUrl}/${hostModelData?.profile}')
                                  : NetworkImage(image.profilePhotodemo),
                            ),
                          ),
                        ),
                        PopinsTextWidget(
                            isBold: false,
                            text: hostModelData!.name,
                            size: 16,
                            color: Colors.white,
                            left: 0,
                            top: 10)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 9,
                child: Column(
                  children: [
                    ListTileWidget(
                      isLogout: false,
                      icon: Icons.person,
                      title: 'Profile Edit',
                      navigation: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileEditScreen()));
                      },
                    ),
                    ListTileWidget(
                        isLogout: false,
                        icon: Icons.lock_person_rounded,
                        title: 'Privacy'),
                    ListTileWidget(
                        isLogout: false,
                        icon: Icons.live_help_rounded,
                        title: 'Help & Info'),
                    ListTileWidget(
                        isLogout: false,
                        icon: Icons.settings,
                        title: 'Settings'),
                    ListTileWidget(
                        navigation: () {
                          signoutConfirmation(context);
                          // signoutConfirmation(context);
                        },
                        isLogout: true,
                        icon: Icons.exit_to_app_outlined,
                        title: 'Logout')
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
