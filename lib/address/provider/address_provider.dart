import 'package:flutter/material.dart';
import 'package:flutter_drive/address/model/address_model.dart';
import 'package:flutter_drive/address/repo/address_repository.dart';

class AddressProvider extends ChangeNotifier {
  final AddressRepository _repository = AddressRepository();
  AddressModel? _addressModel;
  Future<void> getAddressSearch() async {
    _addressModel =
        await _repository.getAddressKeyword(query: '카카오', page: 1, size: 1);
  }

  AddressModel? get addressModel => _addressModel;
}
