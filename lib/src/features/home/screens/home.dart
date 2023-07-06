import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ws_1/src/features/cart/screens/cart.dart';
import 'package:flutter_ws_1/src/features/home/bloc/home_bloc.dart';
import 'package:flutter_ws_1/src/features/home/screens/product_tile_widget.dart';
import 'package:flutter_ws_1/src/features/wishlist/screens/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

@override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    // TODO: implement initState
    super.initState();
  }


  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) =>current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (contest)=> Cart()));
        }
         else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (contest)=> Wishlist()));
        }
      },
      builder: (context, state) {
      switch (state.runtimeType) {
        case HomeLoadingState:
        return Scaffold(body: Center(child: CircularProgressIndicator()),);
           case HomeLoadedSuccessstate:
           final successState = state as HomeLoadedSuccessstate;
  return Scaffold(
          appBar: AppBar(
            title: Text('TUK Grocery App'),
            actions: [
              IconButton(onPressed: (){
                homeBloc.add(HomeWishlistButtonNavigateEvent());
              }, icon: Icon(Icons.favorite_border)),
              IconButton(onPressed: (){
                 homeBloc.add(HomeCartButtonNavigateEvent());
              }, icon: Icon(Icons.shopping_cart_checkout_outlined)),
            ],
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: successState.products.length,
            itemBuilder: (context,index){
            return ProductTileWidget(
              homeBloc: homeBloc,
              productDataModel: successState.products[index]);
          })
        );
           case HomeErrorState:
           return Scaffold(body: Center(child: Text('Error')),);
        default:
        return SizedBox();
      }

      },
    );
  }
}


