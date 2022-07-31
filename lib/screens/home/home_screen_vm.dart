import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:manek/base/base_viewmodel.dart';
import 'package:manek/database/database.dart';
import 'package:manek/model/request/home_request.dart';
import 'package:manek/model/response/home_response.dart';
import 'package:manek/screens/home/home_screen_m.dart';
import 'package:manek/services/network_services.dart';
import 'package:manek/services/network_utils.dart';
import 'package:manek/utils/app_utils.dart';

@injectable
class HomeScreenViewmodel extends BaseViewmodel<HomeScreenState> {
  HomeScreenViewmodel({
    required INetworkService networkService,
    required DatabaseService databaseService,
  })  : _networkService = networkService,
        databaseService = databaseService,
        super(
          const Initialize(
              isBusy: false, data: [], message: "", isError: false),
        );

  final INetworkService _networkService;
  final DatabaseService databaseService;

  fetchData() {
    AppUtils().checkInternet().then((value) {
      if (value) {
        print("soooooo3");

        emit(state.copyWith(isBusy: true));
        HomeRequest request = HomeRequest(page: 1, perPage: 5);
        _networkService
            .get(NetworkUtils.home, params: request.toJson())
            .then((values) {
          if (values?.statusCode == 200) {
            HomeResponse response =
                HomeResponse.fromJson(jsonDecode(values.data));
            emit(state.copyWith(
                data: response.data!, isBusy: false, isError: false));
          } else {
            print("soooooo");
            emit(
                state.copyWith(isError: true, message: "Something went wrong"));
          }
        });
      } else {
        emit(state.copyWith(
            isBusy: false,
            isError: true,
            message: "Please check your internet"));
      }
    });
  }
}
