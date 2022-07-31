import 'package:flutter/cupertino.dart';
import 'package:manek/base/base_viewmodel.dart';
import 'package:manek/setup.dart';

abstract class BaseView<T extends BaseViewmodel> extends StatelessWidget {
  BaseView({Key? key}) : super(key: key) {
    _viewModel = locateService<T>();
  }

  late final T _viewModel;

  T get viewModel => _viewModel;
}
