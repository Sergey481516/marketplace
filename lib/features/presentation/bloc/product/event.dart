import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductEvent extends ProductEvent {
  final String id;

  const GetProductEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
