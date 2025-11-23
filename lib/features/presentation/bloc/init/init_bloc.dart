import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/features/presentation/bloc/product/product_list_cubit.dart';

part 'init_bloc.freezed.dart';

@freezed
abstract class InitEvent with _$InitEvent {
  const factory InitEvent.start() = InitStartEvent;
}

@freezed
abstract class InitState with _$InitState {
  const factory InitState.initial() = InitInitialState;
  const factory InitState.done() = InitDoneState;
}

@injectable
class InitBloc extends Bloc<InitEvent, InitState> {
  final ProductListCubit productListCubit;

  InitBloc(this.productListCubit) : super(const InitState.initial()) {
    on<InitStartEvent>(_init);
  }

  Future<void> _init(InitStartEvent event, Emitter<InitState> emit) async {
    await productListCubit.fetchInitialProducts();

    emit(const InitState.done());
  }
}
