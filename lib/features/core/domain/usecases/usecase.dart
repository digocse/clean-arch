import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
  Stream<Type> callStream(Params params);
}

/// This will be used by the code calling the use case
/// whenever the use case doesn't accept any parameters.
abstract class NoParams extends Equatable {}
