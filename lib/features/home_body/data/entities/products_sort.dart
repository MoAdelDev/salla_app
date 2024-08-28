import 'package:salla_app/core/localization/generated/l10n.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';

abstract class ProductsSort {
  static List<ProductsSort> get sorts => [
        DefaultProductsSort(),
        LowestPriceProductsSort(),
        HighestPriceProductsSort(),
        HasDiscountProductsSort(),
      ];
  const ProductsSort();

  String get title;

  void call(List<ProductModel> products);
}

class DefaultProductsSort extends ProductsSort {
  @override
  String get title => AppLocalizations.current.defaultTitle;

  @override
  void call(List<ProductModel> products) {
    products.sort((a, b) => a.id.compareTo(b.id));
  }
}

class LowestPriceProductsSort extends ProductsSort {
  @override
  String get title => AppLocalizations.current.lowestPrice;

  @override
  void call(List<ProductModel> products) {
    products.sort((a, b) => a.price.compareTo(b.price));
  }
}

class HighestPriceProductsSort extends ProductsSort {
  @override
  String get title => AppLocalizations.current.highestPrice;

  @override
  void call(List<ProductModel> products) {
    products.sort((a, b) => b.price.compareTo(a.price));
  }
}

class HasDiscountProductsSort extends ProductsSort {
  @override
  String get title => AppLocalizations.current.hasDiscount;

  @override
  void call(List<ProductModel> products) {
    products.sort((a, b) => b.discount.compareTo(a.discount));
  }
}
