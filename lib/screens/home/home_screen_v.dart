import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manek/base/base_view.dart';
import 'package:manek/database/database.dart';
import 'package:manek/model/response/home_response.dart';
import 'package:manek/screens/cart/cart_screen_v.dart';
import 'package:manek/screens/home/home_screen_m.dart';
import 'package:manek/screens/home/home_screen_vm.dart';

class HomeScreen extends BaseView<HomeScreenViewmodel> {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    viewModel.fetchData();
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping Mall"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: Icon(CupertinoIcons.cart))
          ],
        ),
        body: SafeArea(child: _buildListCovid()));
  }

  _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider<HomeScreenViewmodel>(
        create: (_) => viewModel.fetchData(),
        child: BlocBuilder<HomeScreenViewmodel, HomeScreenState>(
          bloc: viewModel,
          builder: (context, state) {
            if (state.isBusy) {
              return _buildLoading();
            } else if (state.isError) {
              return _errorMethod(context);
            } else if (!state.isBusy) {
              return _buildCard(context, state.data);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());

  Widget _buildCard(BuildContext context, List<HomeData> data) {
    return GridView.builder(
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.9,
            mainAxisSpacing: 0.9,
            childAspectRatio: 0.98),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 8, top: 5, right: 8),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                      imageUrl: data[index].featuredImage == null
                          ? ""
                          : data[index].featuredImage!,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Image.network(
                          "https://fixnit.ca/media/service_icon/hand.png"),
                      fit: BoxFit.cover,
                    )),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            data[index].title!,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Map<String, dynamic> row = {
                                DatabaseService.productID: data[index].id,
                                DatabaseService.title: data[index].title,
                                DatabaseService.price: data[index].price,
                                DatabaseService.image:
                                    data[index].featuredImage,
                                DatabaseService.quantity: 1,
                              };

                              viewModel.databaseService
                                  .insert(row)
                                  .then((value) {
                                if (value == null) {
                                  showInSnackBar(context,
                                      "This item already in the cart!");
                                } else {
                                  showInSnackBar(context, "Added to the cart");
                                }
                              });
                            },
                            icon: const Icon(CupertinoIcons.cart))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
          ;
        });
  }

  showInSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  _errorMethod(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Please check internet connection"),
          ElevatedButton(
            child: const Text(
              'Try agian',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              viewModel.fetchData();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                textStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
