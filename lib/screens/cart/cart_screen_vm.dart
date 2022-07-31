import 'package:injectable/injectable.dart';
import 'package:manek/base/base_viewmodel.dart';
import 'package:manek/database/database.dart';
import 'package:manek/screens/cart/cart_screen_m.dart';

@injectable
class CartScreenViewmodel extends BaseViewmodel<CartScreenState> {
  CartScreenViewmodel({
    required DatabaseService databaseService,
  })  : databaseService = databaseService,
        super(
          const Initialize(
            isBusy: false,
            data: [],
            grandTotal: 0,
          ),
        );

  final DatabaseService databaseService;

  fetchData() {
    emit(state.copyWith(isBusy: true));
    int grandTotal = 0;
    databaseService.getNoteList().then((value) {
      value.forEach((element) {
        grandTotal = grandTotal + element.price!;
      });
      emit(state.copyWith(isBusy: false, data: value, grandTotal: grandTotal));
    });
  }

  deleteItem(int id) {
    databaseService.deleteItem(id).then((value) {
      fetchData();
    });
  }



}
