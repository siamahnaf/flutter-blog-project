import "package:blogs_system/core/error/failures.dart";
import "package:fpdart/fpdart.dart";

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoPrams {}
