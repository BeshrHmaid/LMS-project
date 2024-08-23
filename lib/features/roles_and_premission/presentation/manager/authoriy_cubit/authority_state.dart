part of 'authority_cubit.dart';

@immutable
sealed class AuthorityState {}

final class AuthorityStateInitial extends AuthorityState {}

final class AuthorityStateLoading extends AuthorityState {}

final class AddAuthorityStateSuccess extends AuthorityState {
  
}
final class GetAuthorityStateSuccess extends AuthorityState {
  final List<Authority>authorities;

  GetAuthorityStateSuccess({required this.authorities});
}

final class AuthorityStateFailure extends AuthorityState {
  final String errorMessage;

  AuthorityStateFailure({required this.errorMessage});
}