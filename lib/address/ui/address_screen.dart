import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/app_color.dart';
import 'package:flutter_drive/address/provider/address_provider.dart';
import 'package:flutter_drive/address/ui/address_item_widget.dart';
import 'package:flutter_drive/address/ui/address_shimmer_widget.dart';
import 'package:flutter_drive/course/provider/course_provider.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  context.read<CourseProvider>().courseSpotClear();
                },
                child: Text(
                  '초기화',
                  style: theme.textTheme.bodyText2!.copyWith(
                      color: appMainColor, fontWeight: FontWeight.bold),
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
                        fontSize: 16),
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
                              color: const Color.fromRGBO(155, 155, 155, 1),
                              fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      "${context.watch<CourseProvider>().courseSpotList.length.toString()}/10",
                      style: theme.textTheme.bodyText2!.copyWith(
                          color: const Color.fromRGBO(155, 155, 155, 1),
                          fontSize: 12),
                    ),
                  ],
                ),
                Flexible(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: provider.isLoading
                        ? shimmerListWidget()
                        : ListView(
                            children: [
                              ...provider.addressDocument.map(
                                (address) => addressItemWidget(
                                    address: address, context: context),
                              ),
                              if (provider.addressDocument.isNotEmpty) ...[
                                if (provider.isMoreLoading)
                                  const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  )
                                else if (provider.isEnd)
                                  Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.error_outline_outlined,
                                          color:
                                              Color.fromRGBO(155, 155, 155, 1),
                                          size: 18,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '더 이상 검색 결과가 없습니다',
                                          style: theme.textTheme.bodyText2!
                                              .copyWith(
                                                  color: const Color.fromRGBO(
                                                      195, 195, 195, 1),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ))
                                else
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<AddressProvider>()
                                          .moreAddressSearch();
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      size: 28,
                                    ),
                                    color: Colors.white,
                                  )
                              ],
                            ],
                          ),
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
