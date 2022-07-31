import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manek/base/base_view.dart';
import 'package:manek/model/response/home_database.dart';
import 'package:manek/screens/cart/cart_screen_m.dart';
import 'package:manek/screens/cart/cart_screen_vm.dart';

class CartScreen extends BaseView<CartScreenViewmodel> {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.fetchData();
    return Scaffold(
        appBar: AppBar(
            title: Text("My Cart"),
            centerTitle: true,
            leading: IconButton(
                icon: Icon(CupertinoIcons.arrow_left),
                onPressed: () {
                  Navigator.pop(context);
                })),
        bottomNavigationBar: BlocBuilder<CartScreenViewmodel, CartScreenState>(
          bloc: viewModel,
          builder: (context, state) {
            if (state.isBusy) {
              return _buildLoading();
            } else if (!state.isBusy) {
              return _buildBottom(context, state.data, state.grandTotal);
            } else {
              return Container();
            }
          },
        ),
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: BlocProvider<CartScreenViewmodel>(
            create: (_) => viewModel.fetchData(),
            child: BlocBuilder<CartScreenViewmodel, CartScreenState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state.isBusy) {
                  return _buildLoading();
                } else if (!state.isBusy) {
                  return _buildCard(context, state.data);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildCard(BuildContext context, List<HomeDatabase> data) {
    return SafeArea(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                elevation: 5,
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          height: 120,
                          width: 100,
                          imageUrl: data[index].image == null
                              ? ""
                              : data[index].image!,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Image.network(
                              "https://fixnit.ca/media/service_icon/hand.png"),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].title.toString()),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Price"),
                                  Text("${"\$"}${data[index].price}"),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Quantity"),
                                  Text("${data[index].quantity}"),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              ElevatedButton(
                                child: const Text(
                                  'Remove Item',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  alertDialogue(
                                      context, data[index].productID!);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 5),
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
            ;
          }),
    );
  }

  Widget _buildBottom(
      BuildContext context, List<HomeDatabase> data, int grandTotal) {
    return Container(
      height: 50,
      color: Colors.blue.withOpacity(0.9),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "${"Total items:"} ${data.length.toString()}",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "${"Grand Total:"} ${grandTotal.toString()}",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  alertDialogue(BuildContext context, int id) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: Text('Are you sure you want to remove this item?'),
              actions: [
                ElevatedButton(
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    viewModel.deleteItem(id);
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ]);
        });
  }
}
