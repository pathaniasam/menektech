import 'package:bloc/bloc.dart';

abstract class BaseViewmodel<T> extends Cubit<T> {
  BaseViewmodel(T initialState) : super(initialState);
}
