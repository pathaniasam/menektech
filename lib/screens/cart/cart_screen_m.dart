import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manek/base/base_state.dart';
import 'package:manek/model/response/home_database.dart';

part 'cart_screen_m.freezed.dart';

@freezed
class CartScreenState extends BaseState with _$CartScreenState {
  const factory CartScreenState.initialize({
    required bool isBusy,
    required List<HomeDatabase> data,
    required int grandTotal,
  }) = Initialize;
}
