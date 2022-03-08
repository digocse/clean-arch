abstract class UseCase<Type, Params> {
  Stream<Type> callStream(Params params);
}
