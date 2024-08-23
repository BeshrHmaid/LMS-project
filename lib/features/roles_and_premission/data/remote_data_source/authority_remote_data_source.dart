// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:lms/core/utils/api.dart';
import 'package:lms/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:lms/features/roles_and_premission/data/models/authority.dart';

abstract class AuthorityRemoteDataSource {
  Future<List<Authority>> getAuthorities();
  Future<void> addAuthorities(List<Authority> authorities);
}

class AuthorityRemoteDataSourceImpl extends AuthorityRemoteDataSource {
  final Api api;
  AuthorityRemoteDataSourceImpl({
    required this.api,
  });
  @override
  Future<void> addAuthorities(List<Authority> authorities) async {
    List<Map<String, dynamic>> body =
        authorities.map((authority) => authority.toJson()).toList();
    await api.post(endPoint: 'api/authorities', body: body,token: jwtToken);
  }

  @override
  Future<List<Authority>> getAuthorities() async {
    List<Authority> authorities = [];
    print(jwtToken);
    var result = await api.get(endPoint: 'api/authorities',token: jwtToken);
    for (var authorityData in result) {
      authorities.add(Authority.fromJson(authorityData));
    }
    return authorities;
  }
}
