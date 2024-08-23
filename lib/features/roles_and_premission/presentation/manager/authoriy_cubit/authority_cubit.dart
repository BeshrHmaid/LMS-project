import 'package:bloc/bloc.dart';
import 'package:lms/features/roles_and_premission/data/models/authority.dart';
import 'package:lms/features/roles_and_premission/domain/use_case/authority_use_case/add_authorities_use_case.dart';
import 'package:lms/features/roles_and_premission/domain/use_case/authority_use_case/get_authorities_use_case.dart';
import 'package:meta/meta.dart';

part 'authority_state.dart';

class AuthorityCubit extends Cubit<AuthorityState> {
  AuthorityCubit(this.addAuthoritiesUseCase, this.getAuthoritiesUseCase) : super(AuthorityStateInitial());
  final AddAuthoritiesUseCase addAuthoritiesUseCase;
  final GetAuthoritiesUseCase getAuthoritiesUseCase;

  Future<void> addAuthorities(List<Authority>authorities) async {
    emit(AuthorityStateLoading());
    var result = await addAuthoritiesUseCase.call(authorities: authorities);
    result.fold(
      (failure) {
        emit(AuthorityStateFailure(errorMessage: failure.message));
      },
      (authorities) {
        emit(AddAuthorityStateSuccess());
      },
    );
  }

  Future<void> getAuthorities() async {
    emit(AuthorityStateLoading());
    var result = await getAuthoritiesUseCase.call();
    result.fold(
      (failure) {
        emit(AuthorityStateFailure(errorMessage: failure.message));
      },
      (authorities) {
        emit(GetAuthorityStateSuccess(authorities: authorities));
      },
    );
  }

}
