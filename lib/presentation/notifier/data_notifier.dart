import 'package:flutter/material.dart';
import 'package:price_app/models/product_model.dart';
import 'package:price_app/data/product_data.dart';
import 'package:price_app/utils/enum.dart';
import 'package:price_app/utils/utilities.dart';

class DataNotifier extends ChangeNotifier {
  String _query = '';
  ProductSearchScope _activeScope = ProductSearchScope.all;

  List<ProductModel> _allProducts = [];
  List<ProductModel> _filteredResults = [];

  // search results per scope buffers
  List<ProductModel> _allSearch = [];
  List<ProductModel> _groceriesSearch = [];
  List<ProductModel> _techSearch = [];
  List<ProductModel> _houseSearch = [];

  DataNotifier() {
    populateData();
  }

  void populateData() {
    _allProducts = ProductData.products;
    _syncBuffers();
    _recomputeFilteredResults();
    notifyListeners();
  }

  void _syncBuffers() {
    _allSearch = List.of(_allProducts);
    _groceriesSearch = _allProducts
        .where(
          (p) => Utils.normalizeStringToLowerCase(p.category) == 'groceries',
        )
        .toList();
    _techSearch = _allProducts
        .where(
          (p) =>
              Utils.normalizeStringToLowerCase(p.category) == 'tech' ||
              Utils.normalizeStringToLowerCase(p.category) == 'apple',
        )
        .toList();
    _houseSearch = _allProducts
        .where((p) => Utils.normalizeStringToLowerCase(p.category) == 'pantry')
        .toList();
  }

  String get query => _query;
  ProductSearchScope get activeScope => _activeScope;
  List<ProductModel> get filteredResults => List.unmodifiable(_filteredResults);
  bool get hasQuery => _query.trim().isNotEmpty;

  void applySearch({required String query, required ProductSearchScope scope}) {
    _query = query;
    _activeScope = scope;

    if (query.trim().isEmpty) {
      _syncBuffers();
    } else {
      final tokens = query
          .trim()
          .toLowerCase()
          .split(RegExp(r'\s+'))
          .where((t) => t.isNotEmpty)
          .toList();

      List<ProductModel> filterPool(List<ProductModel> pool) {
        return pool.where((p) {
          final hay = '${p.name} ${p.category} ${p.lowestPriceStore}'
              .toLowerCase();
          return tokens.every((t) => hay.contains(t));
        }).toList();
      }

      // In this app, we might want to search across everything or specific scope
      if (scope == ProductSearchScope.all) {
        _allSearch = filterPool(_allProducts);
      } else {
        final pool = _allProducts
            .where((p) => _matchesScope(p, scope))
            .toList();
        final filtered = filterPool(pool);

        switch (scope) {
          case ProductSearchScope.groceries:
            _groceriesSearch = filtered;
            break;
          case ProductSearchScope.tech:
            _techSearch = filtered;
            break;
          case ProductSearchScope.house:
            _houseSearch = filtered;
            break;
          case ProductSearchScope.all:
            break;
        }
      }
    }

    _recomputeFilteredResults();
    notifyListeners();
  }

  bool _matchesScope(ProductModel p, ProductSearchScope scope) {
    final cat = Utils.normalizeStringToLowerCase(p.category);
    switch (scope) {
      case ProductSearchScope.groceries:
        return cat == 'groceries';
      case ProductSearchScope.tech:
        return cat == 'tech' || cat == 'apple';
      case ProductSearchScope.house:
        return cat == 'pantry';
      case ProductSearchScope.all:
        return true;
    }
  }

  void _recomputeFilteredResults() {
    switch (_activeScope) {
      case ProductSearchScope.all:
        _filteredResults = _allSearch;
        break;
      case ProductSearchScope.groceries:
        _filteredResults = _groceriesSearch;
        break;
      case ProductSearchScope.tech:
        _filteredResults = _techSearch;
        break;
      case ProductSearchScope.house:
        _filteredResults = _houseSearch;
        break;
    }
  }

  void clearSearch() {
    _query = '';
    _syncBuffers();
    _recomputeFilteredResults();
    notifyListeners();
  }
}
