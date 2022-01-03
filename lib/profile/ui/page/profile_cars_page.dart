import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_drive/profile/ui/widgets/profile_appbar_widget.dart';

class ProfileCarsPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final List<String> cars;
  ProfileCarsPage({
    Key? key,
    required this.cars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: profileAppbarWidget(
          context: context,
          color: appMainColor,
          isLoading: context.read<ProfileProvider>().isLoading,
          onTap: () {
            context.read<ProfileProvider>().profileCarsUpdate(
                context: context,
                userKey: context.read<AuthProvider>().user!.userKey);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Icon(Icons.add_box_outlined, size: 18, color: appMainColor),
                    const SizedBox(width: 6),
                    Text('자신의 차량을 등록해 주세요',
                        style: theme.textTheme.bodyText2!.copyWith(
                          color: appMainColor,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.35,
                      height: size.height * 0.06,
                      child: TextFormField(
                          controller: _controller,
                          onFieldSubmitted: (value) {
                            context
                                .read<ProfileProvider>()
                                .profileAddCars(value: value);
                            _controller.clear();
                          },
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: '차량의 애칭을 입력해 주세요',
                            hintStyle: theme.textTheme.bodyText2!.copyWith(
                                color: const Color.fromRGBO(155, 155, 155, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    IconButton(
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        context
                            .read<ProfileProvider>()
                            .profileAddCars(value: _controller.text);
                        _controller.clear();
                      },
                      icon: const Icon(Icons.add_box, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                children: [
                  ...cars.map(
                    (e) => _carsListWrapForm(
                        title: e,
                        color: context
                                .watch<ProfileProvider>()
                                .deleteCars
                                .contains(e)
                            ? const Color.fromRGBO(115, 115, 115, 1)
                            : appMainColor,
                        onTap: () {
                          context
                              .read<ProfileProvider>()
                              .profileDeleteCars(value: e);
                        }),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  width: size.width,
                  height: 1,
                  color: const Color.fromRGBO(71, 71, 71, 1),
                ),
              ),
              Wrap(
                children: [
                  ...context.watch<ProfileProvider>().addCars.map(
                        (e) => _carsListWrapForm(
                            title: e,
                            color: appSubColor,
                            onTap: () {
                              context
                                  .read<ProfileProvider>()
                                  .profileAddCars(value: e);
                            }),
                      )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Stack _carsListWrapForm({
    required Color color,
    required String title,
    required Function() onTap,
  }) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: color),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(title,
                    style: theme.textTheme.bodyText2!
                        .copyWith(fontSize: 12, fontWeight: FontWeight.bold))),
          ),
        ),
        Positioned(
          right: -3,
          top: -3,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: darkThemeMainColor,
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.remove_circle_outline_outlined,
                  size: 15, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
