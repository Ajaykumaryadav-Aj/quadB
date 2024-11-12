import 'package:flutter/material.dart';
import 'package:quad/models/show_model.dart';
import 'package:quad/services/service.dart';

class ShowProvider with ChangeNotifier {
  List<ShowModel> _data = [];
  List<ShowModel> _filteredData = [];
  bool _isLoading = true;

  List<ShowModel> get shows => _filteredData.isEmpty ? _data : _filteredData;
  bool get isLoading => _isLoading;

  ShowProvider() {
    fetchShows();
  }

  Future<void> fetchShows() async {
    _isLoading = true;
    notifyListeners();

    _data = await ApiService().fetchData();
    _filteredData = _data; // Initially set filteredShows for all data
    _isLoading = false;
    notifyListeners();
  }

  void filterShows(String query) {
    if (query.isEmpty) {
      _filteredData = _data;
    } else {
      _filteredData = _data
          .where((show) =>
              show.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
