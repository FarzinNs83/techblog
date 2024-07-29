import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog_app/component/my_string.dart';
import 'package:techblog_app/gen/assets.gen.dart';
import 'package:techblog_app/view/my_categories.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.images.bot.path, height: 100),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyString.welcome, style: textTheme.titleSmall)),
            ),
            // BottomSheet
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size, textTheme);
                },
                child: const Text("بزن بریم"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<dynamic> _showEmailBottomSheet(
    BuildContext context, Size size, TextTheme textTheme) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: size.height / 2.5,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyString.userEmail,
                  style: textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    onChanged: (value) {
                      isEmail(value);
                      print("$value is Email : ${isEmail(value)}");
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "techblog@gmail.com",
                        hintStyle: textTheme.labelSmall),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _activateCodeBottomSheet(context, size, textTheme);
                    },
                    child: const Text("ادامه"))
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<dynamic> _activateCodeBottomSheet(
    BuildContext context, Size size, TextTheme textTheme) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: size.height / 2.5,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyString.activateCode,
                  style: textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "******", hintStyle: textTheme.labelSmall),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MyCategories(),
                      ));
                    },
                    child: const Text("ادامه"))
              ],
            ),
          ),
        ),
      );
    },
  );
}
