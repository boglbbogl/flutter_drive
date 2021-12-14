import 'package:flutter/material.dart';
import 'package:flutter_drive/_constant/logger.dart';
import 'package:flutter_drive/address/model/address_model.dart';
import 'package:flutter_drive/address/repo/address_repository.dart';

class AddressProvider extends ChangeNotifier {
  final AddressRepository _repository = AddressRepository();
  AddressModel? _addressModel;
  Future<void> getAddressSearch({
    required String query,
  }) async {
    _addressModel = await _repository.getAddressKeyword(query: query, page: 1);
    notifyListeners();
    // logger.e(_addressModel!.documents);
  }

  AddressModel? get addressModel => _addressModel;
}
