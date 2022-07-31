import 'package:flutter/cupertino.dart';
import 'package:manek/base/base_viewmodel.dart';
import 'package:manek/setup.dart';

abstract class BasesView<T extends BaseViewmodel> extends StatefulWidget {
  BasesView({Key? key}) : super(key: key) {
    _viewModel = locateService<T>();
  }

  late final T _viewModel;

  T get viewModel => _viewModel;
}
