import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/_constant/profile_city_data.dart';
import 'package:flutter_drive/auth/provider/auth_provider.dart';
import 'package:flutter_drive/profile/provider/profile_provider.dart';
import 'package:flutter_drive/profile/ui/widgets/profile_appbar_widget.dart';
import 'package:flutter_drive/profile/ui/widgets/profile_text_form_widget.dart';
import 'package:provider/provider.dart';

class ProfileCityPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final List<String> city;
  ProfileCityPage({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbarWidget(
          context: context,
          color: appMainColor,
          isLoading: context.read<ProfileProvider>().isLoading,
          onTap: () {
            context.read<ProfileProvider>().profileCityUpdate(
                userKey: context.read<AuthProvider>().user!.userKey,
                context: context);
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textForm(
                title: '활동 지역을 추가해 주세요',
                color: appMainColor,
                icon: Icons.add_box_outlined,
                iconSize: 18),
            profileTextFormWidget(
                horizontal: 8,
                controller: _controller,
                hintText: '지역을 입력해 주세요',
                onFieldSubmitted: (value) {
                  context.read<ProfileProvider>().profileAddCity(value: value);
                  _controller.clear();
                },
                onTap: () {
                  context
                      .read<ProfileProvider>()
                      .profileAddCity(value: _controller.text);
                  _controller.clear();
                }),
            Wrap(
              children: [
                ...context
                    .watch<ProfileProvider>()
                    .addCity
                    .map((e) => _wrapWidgetForm(
                        title: e,
                        color: appMainColor,
                        isShow: true,
                        removeOnTap: () {
                          context
                              .read<ProfileProvider>()
                              .profileDeleteCity(value: e);
                        }))
              ],
            ),
            if (city.isNotEmpty) ...[
              const SizedBox(height: 8),
              _textForm(
                  title: '기존에 설정한 지역',
                  color: appSubColor,
                  icon: Icons.circle,
                  iconSize: 10),
              const SizedBox(height: 8),
              Wrap(
                children: [
                  ...city.map((e) => _wrapWidgetForm(
                      title: e,
                      color: context
                              .watch<ProfileProvider>()
                              .deleteCity
                              .contains(e)
                          ? const Color.fromRGBO(91, 91, 91, 1)
                          : appSubColor,
                      isShow: true,
                      removeOnTap: () {
                        context
                            .read<ProfileProvider>()
                            .profileDeleteCity(value: e);
                      }))
                ],
              ),
            ],
            const SizedBox(height: 25),
            _textForm(
                title: '추천 지역',
                color: appSubColor,
                icon: Icons.circle,
                iconSize: 10),
            const SizedBox(height: 8),
            Wrap(
              children: [
                ...ProfileCityData().city.map((e) => _wrapWidgetForm(
                    isShow: false,
                    title: e,
                    color: const Color.fromRGBO(155, 155, 155, 1),
                    onTap: () {
                      context.read<ProfileProvider>().profileAddCity(value: e);
                    }))
              ],
            )
          ],
        ),
      ),
    );
  }

  Stack _wrapWidgetForm({
    required String title,
    required Color color,
    Function()? onTap,
    Function()? removeOnTap,
    required bool isShow,
  }) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          child: InkWell(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: color),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Text(
                    title,
                    style: theme.textTheme.bodyText2!
                        .copyWith(color: Colors.white, fontSize: 10),
                  ),
                )),
          ),
        ),
        if (isShow) ...[
          Positioned(
            top: -3,
            right: -3,
            child: InkWell(
              onTap: removeOnTap,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: darkThemeMainColor),
                child: const Center(
                  child: Icon(
                    Icons.remove_circle_outline_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ],
    );
  }

  Padding _textForm({
    required String title,
    required Color color,
    required IconData icon,
    required double iconSize,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: iconSize,
          ),
          const SizedBox(width: 6),
          Text(
            title,
            style: theme.textTheme.bodyText2!.copyWith(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
