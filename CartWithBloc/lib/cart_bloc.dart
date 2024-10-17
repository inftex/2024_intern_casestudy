import 'package:flutter_bloc/flutter_bloc.dart';
import 'product.dart';

abstract class CartEvent {}

class AddProduct extends CartEvent {
  final Product product;
  AddProduct(this.product);
}

class CartState {
  final List<Product> cart;
  final double totalPrice;

  CartState(this.cart, this.totalPrice);
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([], 0.0)) {
    on<AddProduct>((event, emit) {
      final updatedCart = List<Product>.from(state.cart);
      if (!updatedCart.contains(event.product)) {
        updatedCart.add(event.product);
        final updatedPrice =
            updatedCart.fold(0.0, (sum, item) => sum + item.price);
        emit(CartState(updatedCart, updatedPrice));
      }
    });
  }
}
