import 'package:flutter_base_app/src/models/Item.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ItemState {}

class ItemsUnloaded extends ItemState {}

class ItemsFetched extends ItemState {
  final List<Item> items;
  ItemsFetched(this.items);
}

class FetchError extends ItemState {}
