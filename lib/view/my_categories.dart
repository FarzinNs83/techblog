import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog_app/component/constant/my_colors.dart';
import 'package:techblog_app/component/my_component.dart';
import 'package:techblog_app/component/constant/my_string.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/model/fake_data.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                SvgPicture.asset(
                  Assets.images.bot.path,
                  height: 100,
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyString.successfulRegistration,
                      style: textTheme.headlineSmall),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.labelSmall),
                ),
                const SizedBox(height: 32),
                Text(MyString.chooseCategory, style: textTheme.headlineSmall),
                const SizedBox(height: 24),
                // HashTag List
                SizedBox(
                  width: double.infinity,
                  height: 85,
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: tagList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedCategories
                                  .contains(tagList[index])) {
                                selectedCategories.add(tagList[index]);
                              } else {}
                              debugPrint("${tagList[index]} Exists");
                            });
                          },
                          child:
                              HashtagList(textTheme: textTheme, index: index));
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Image(image: Assets.images.arrow.provider(), height: 60),

                const SizedBox(height: 24),
                // Selected Categories
                SizedBox(
                  width: double.infinity,
                  height: 85,
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: selectedCategories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              color: SolidColors.surfaceColor),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 8),
                                Text(selectedCategories[index].title,
                                    style: textTheme.displayMedium),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedCategories.removeAt(index);
                                    });
                                  },
                                  child: const Icon(Icons.delete_outline,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
