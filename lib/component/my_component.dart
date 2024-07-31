import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog_app/component/my_colors.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/model/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.divider,
      thickness: 1,
      indent: size.width / 6,
      endIndent: size.width/6,
    );
  }
}

class HashtagList extends StatelessWidget {
   HashtagList({
    super.key,
    required this.textTheme,
    required this.index
  });

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            children: [
              ImageIcon(Assets.images.hashtag.provider(),
                  color: Colors.white, size: 14),
              const SizedBox(width: 8),
              Text(tagList[index].title, style: textTheme.titleMedium)
            ],
          ),
        ));
  }
}

mylaunchUrl(String url) async{
  var uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  } else {
    print("Could not launch");
  }
}


class MyLoading extends StatelessWidget {
  const MyLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 32,
    );
  }
}