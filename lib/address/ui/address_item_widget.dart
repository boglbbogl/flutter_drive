import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/address/model/address_model.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:provider/provider.dart';

Padding addressItemWidget({
  required AddressModelDocument address,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: InkWell(
      onTap: () {
        context.read<CourseProvider>().getCourseSpotList(
            context: context,
            courseSpot: context.read<CourseProvider>().courseSpot.copyWith(
                  placeName: address.placeName,
                  addressName: address.roadAddressName.isEmpty
                      ? address.addressName
                      : address.roadAddressName,
                  id: address.id,
                  lat: address.latitude,
                  lon: address.longitude,
                ));
      },
      child: Container(
        width: size.width,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: context
                  .watch<CourseProvider>()
                  .courseSpotList
                  .map((e) => e.id)
                  .contains(address.id)
              ? Border.all(color: appSubColor, width: 3)
              : Border.all(
                  color: const Color.fromRGBO(115, 115, 115, 1), width: 2.5),
          color: const Color.fromRGBO(71, 71, 71, 1),
        ),
        child: DefaultTextStyle(
          style: theme.textTheme.bodyText2!.copyWith(
              fontSize: 11, color: const Color.fromRGBO(225, 225, 225, 1)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                address.placeName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyText2!.copyWith(
                    color: appSubColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Column(
                children: [
                  Text(address.roadAddressName),
                  const SizedBox(height: 2),
                  Text(address.addressName),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
