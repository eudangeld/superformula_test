import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<ResponseType, Params> {
  Future<Either<Failure, ResponseType>> call(Params params);
}

class NoParams {}
