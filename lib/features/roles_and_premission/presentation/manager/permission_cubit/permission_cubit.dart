import 'package:bloc/bloc.dart';
import 'package:lms/features/roles_and_premission/data/models/permission.dart';
import 'package:meta/meta.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionInitial());
}
