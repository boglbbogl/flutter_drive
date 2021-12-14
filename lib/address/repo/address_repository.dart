import 'dart:convert';

import 'package:flutter_drive/address/model/address_model.dart';
import 'package:http/http.dart' as http;

class AddressRepository {
  static final AddressRepository _repository = AddressRepository._internal();
  factory AddressRepository() => _repository;
  AddressRepository._internal();

  Future<AddressModel?> getAddressKeyword({
    required String query,
    required int page,
  }) async {
    const apiBase = 'https://dapi.kakao.com';
    const apiKey = 'f040fd49aeeb43372643c860fc9b266f';
    final uri = Uri.parse(
        "$apiBase/v2/local/search/keyword.json?page=$page&query=$query");
    final response = await http.get(uri, headers: {
      'Authorization': 'KakaoAK $apiKey',
      "Content-Type": "application/json",
    });
    if (response.statusCode == 200) {
      final decoded = json.decode(utf8.decode(response.bodyBytes));
      final result = AddressModel.fromJson(decoded as Map<String, dynamic>);
      return result;
    }
  }
}
