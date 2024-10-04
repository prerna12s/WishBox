import 'package:fpdart/fpdart.dart';
import 'package:network_app/core/failure.dart';
// ye shorthand use karne ka
//fpdart null checks ko alag se check karne ka problem hta deta hain
//kuch hi hita hain isme Either<L,R>
//success to right varna L;
//see documnetation ...if needed !!
//new good package ....fpdart
typedef FutureEither<T>=Future<Either<Failure,T>>;
typedef FutureVoid =FutureEither<void>;