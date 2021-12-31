import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';

Positioned profileCarsBottomWidget({
  required BuildContext context,
  required bool isCars,
  required TextEditingController controller,
}) {
  return Positioned(
    left: 30,
    right: 30,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(0, isCars ? 0 : -size.height, 0),
      width: size.width,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        border: Border.all(color: appMainColor),
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromRGBO(51, 51, 51, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.4,
              child: TextFormField(
                controller: controller,
                style: theme.textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontSize: 11,
                ),
                decoration: InputDecoration(
                    hintStyle: theme.textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(195, 195, 195, 1),
                        fontSize: 11),
                    hintText: ' 자동차 이름을 입력해주세요',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onFieldSubmitted: (value) {
                  context.read<ProfileProvider>()
                    ..changedAddCars(value: value)
                    ..showCarsChangedWidget(value: false);
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  context.read<ProfileProvider>()
                    ..changedAddCars(value: controller.text)
                    ..showCarsChangedWidget(value: false);
                  FocusScope.of(context).unfocus();
                },
                icon: Icon(Icons.add_circle, color: appMainColor))
          ],
        ),
      ),
    ),
  );
}
