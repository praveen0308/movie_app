import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure,T>>;
typedef DataMap = Map<String,dynamic>;
