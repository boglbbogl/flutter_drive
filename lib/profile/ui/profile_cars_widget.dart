import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:provider/provider.dart';

Column profileCarsWidget({
  required BuildContext context,
  required List<String> cars,
  required List<String> profileCars,
  required List<String> loadCars,
}) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          context.read<ProfileProvider>().showCarsChangedWidget(value: true);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 40, top: 15),
          child: Row(
            children: [
              Icon(
                Icons.add_box_outlined,
                color: appMainColor,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                '자동차 추가하기',
                style: theme.textTheme.bodyText2!.copyWith(
                    color: appMainColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
        child: SizedBox(
          width: size.width * 0.9,
          height: size.height * 0.06,
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ...profileCars.map((e) => _carsListItem(
                    color: loadCars.contains(e)
                        ? const Color.fromRGBO(91, 91, 91, 1)
                        : appMainColor,
                    onTap: () {
                      context
                          .read<ProfileProvider>()
                          .loadCarsAddAndRemove(value: e);
                    },
                    text: e)),
                ...cars.map((e) => _carsListItem(
                    color: appSubColor,
                    onTap: () {
                      context
                          .read<ProfileProvider>()
                          .changedRemoveCars(value: e);
                    },
                    text: e)),
              ]),
        ),
      )
    ],
  );
}

Stack _carsListItem({
  required Function() onTap,
  required String text,
  required Color color,
}) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Center(
          child: Container(
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: color),
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  Text(text,
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: Colors.white, fontSize: 12)),
                  const SizedBox(width: 14),
                ],
              )),
        ),
      ),
      Positioned(
        right: 2,
        top: 2,
        child: InkWell(
          onTap: onTap,
          child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: darkThemeCardColor),
              child: const Center(
                child: Icon(Icons.remove_circle_outline_rounded,
                    size: 15, color: Colors.white),
              )),
        ),
      )
    ],
  );
}
