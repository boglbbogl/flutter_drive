import 'package:flutter/material.dart';
import 'package:flutter_drive/address/model/address_model.dart';
import 'package:flutter_drive/address/repo/address_repository.dart';

class AddressProvider extends ChangeNotifier {
  final AddressRepository _repository = AddressRepository();

  AddressModel? _addressModel;
  List<AddressModelDocument> _addressDocument = [];
  bool _isLoading = false;
  bool _isMoreLoading = false;
  String _query = "";
  int _page = 0;
  bool _isEnd = false;

  Future<void> getAddressSearch({
    required String query,
  }) async {
    _isLoading = true;
    notifyListeners();
    _addressModel = await _repository.getAddressKeyword(query: query, page: 1);
    _addressDocument = _addressModel!.documents;
    Future.delayed(const Duration(milliseconds: 500), () {
      _isEnd = _addressModel!.meta.isEnd;
      _query = query;
      _page = 1;
      _isLoading = false;
      notifyListeners();
    });
  }

  Future<void> moreAddressSearch() async {
    if (!_isEnd) {
      _isMoreLoading = true;
      notifyListeners();
      _addressModel =
          await _repository.getAddressKeyword(query: _query, page: _page + 1);
      _addressDocument.addAll(_addressModel!.documents);
      _isEnd = _addressModel!.meta.isEnd;
      _page = _page + 1;
      _isMoreLoading = false;
      notifyListeners();
    } else {
      // show snackbar
    }
  }

  // AddressModel? get addressModel => _addressModel;
  bool get isLoading => _isLoading;
  bool get isMoreLoading => _isMoreLoading;
  bool get isEnd => _isEnd;
  List<AddressModelDocument> get addressDocument => _addressDocument;
}
