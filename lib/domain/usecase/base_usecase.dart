abstract class BaseUseCase<Result> {}

abstract class BaseUseCaseWithoutParams<Result> implements BaseUseCase<Result> {
  Result call();
}

abstract class BaseUseCaseWithParams<Param,Result>
    implements BaseUseCase<Result> {
  Result call(Param param);
}
