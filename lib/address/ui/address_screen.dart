import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/address/provider/address_provider.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  '초기화',
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: appSubColor, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                TextFormField(
                  onFieldSubmitted: (value) {
                    context
                        .read<AddressProvider>()
                        .getAddressSearch(query: value);
                  },
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                    hintText: ' 드라이브 코스를 검색해 주세요',
                    hintStyle: theme.textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(155, 155, 155, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.error_outline_outlined,
                          color: Color.fromRGBO(155, 155, 155, 1),
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '코스는 최대 10개 까지 추가할 수 있습니다',
                          style: theme.textTheme.bodyText2!.copyWith(
                              color: const Color.fromRGBO(155, 155, 155, 1)),
                        ),
                      ],
                    ),
                    Text(
                      '1/10',
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(155, 155, 155, 1)),
                    ),
                  ],
                ),
                if (provider.addressModel == null)
                  Container()
                else
                  Flexible(
                    child: ListView(
                      // shrinkWrap: true,
                      children: [
                        ...provider.addressModel!.documents.map((address) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                width: size.width,
                                height: size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          115, 115, 115, 1),
                                      width: 2.5),
                                  color: const Color.fromRGBO(71, 71, 71, 1),
                                ),
                                child: DefaultTextStyle(
                                  style: theme.textTheme.bodyText2!.copyWith(
                                      fontSize: 11,
                                      color: const Color.fromRGBO(
                                          225, 225, 225, 1)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        address.placeName,
                                        style: theme.textTheme.bodyText2!
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
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
                            )),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 28,
                          ),
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
