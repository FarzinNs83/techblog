import 'package:flutter/material.dart';
import 'package:techblog_app/component/constant/my_colors.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/component/constant/my_string.dart';
import 'package:techblog_app/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.textTheme,
    required this.bodyMargin,
  });

  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: Assets.images.avatar.provider(), height: 100),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(Assets.images.pen.provider(),
                      color: SolidColors.seeMore),
                  const SizedBox(height: 8),
                  Text(MyString.imageProfileEdit, style: textTheme.bodyMedium)
                ],
              ),
              const SizedBox(height: 55),
              Text("فاطمه امیری", style: textTheme.bodySmall),
              Text("fatemeamiri@gmail.com", style: textTheme.bodySmall),
              const SizedBox(height: 40),
              const TechDivider(),
              InkWell(
                onTap: () {},
                splashColor: SolidColors.primaryColor,
                child: SizedBox(
                    height: 40,
                    child: Center(
                        child: Text(MyString.favBlog,
                            style: textTheme.bodySmall))),
              ),
              const TechDivider(),
              InkWell(
                onTap: () {},
                splashColor: SolidColors.primaryColor,
                child: SizedBox(
                    height: 40,
                    child: Center(
                        child: Text(MyString.favPodcast,
                            style: textTheme.bodySmall))),
              ),
              const TechDivider(),
              InkWell(
                onTap: () {},
                splashColor: SolidColors.primaryColor,
                child: SizedBox(
                    height: 40,
                    child: Center(
                        child:
                            Text(MyString.logOut, style: textTheme.bodySmall))),
              ),
              const SizedBox(height: 60)
            ],
          ),
        ));
  }
}
