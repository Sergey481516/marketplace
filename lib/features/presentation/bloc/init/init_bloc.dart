import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/features/presentation/bloc/init/init_event.dart';
import 'package:marketplace/features/presentation/bloc/init/init_state.dart';

import 'package:marketplace/features/presentation/bloc/product/product_list_cubit.dart';

@singleton
class InitBloc extends Bloc<InitEvent, InitState> {
  final ProductListCubit productListCubit;

  InitBloc(this.productListCubit) : super(InitInitial()) {
    on<Initialize>(_init);
  }

  Future<void> _init(Initialize event, Emitter<InitState> emit) async {
    await productListCubit.fetchInitialProducts();

    emit(InitDone());
  }
}
