import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/search/logic/cubit/search_state.dart';

class SearchCubit extends BaseSafeCubit<SearchState> {
  SearchCubit() : super(const SearchState.initial());

  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];
  final TextEditingController searchController = TextEditingController();
  void emitGetProducts(List<ProductModel> products) {
    safeEmit(const SearchState.loading());
    this.products = products;
    safeEmit(const SearchState.success());
  }

  void search(String text) {
    safeEmit(const SearchState.initial());
    filteredProducts = products
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
    safeEmit(const SearchState.success());
  }
}
