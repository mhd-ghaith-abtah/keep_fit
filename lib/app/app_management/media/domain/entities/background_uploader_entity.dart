import 'package:keep_fit/core/features/domain/entities/entity.dart';

class BackgroundUploaderEntity extends Entity {
  final String? taskId;

  BackgroundUploaderEntity({required this.taskId});

  @override
  List<Object?> get props => [taskId];
}
