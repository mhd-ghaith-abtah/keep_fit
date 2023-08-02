import 'package:keep_fit/core/features/domain/entities/entity.dart';

class ErrorEntity extends Entity {
  final int statusCode;
  final String message;

  ErrorEntity({
    required this.statusCode,
    required this.message,
  });

  @override
  List<Object?> get props => [statusCode, message];
}
