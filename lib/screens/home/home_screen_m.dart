import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manek/base/base_state.dart';
import 'package:manek/model/response/home_response.dart';

part 'home_screen_m.freezed.dart';

@freezed
class HomeScreenState extends BaseState with _$HomeScreenState {
  const factory HomeScreenState.initialize({
    required bool isBusy,
    required List<HomeData> data,
    required String message,
    required bool isError,
  }) = Initialize;
}
