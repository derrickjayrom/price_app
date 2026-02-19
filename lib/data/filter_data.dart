import 'package:price_app/models/filter_model.dart';

class FilterData {
  static List<FilterModel> filterItems = [
    FilterModel(id: 1, name: 'Rating', filterValue: 'Rating'),
    FilterModel(id: 2, name: 'Price', filterValue: 'Price'),
    FilterModel(
      id: 3,
      name: 'Price High to Low',
      filterValue: 'price_high_to_low',
    ),
    FilterModel(id: 4, name: 'Most Popular', filterValue: 'most_popular'),
    FilterModel(id: 5, name: 'Trending', filterValue: 'trending'),
  ];
}
