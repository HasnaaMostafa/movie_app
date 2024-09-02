import 'package:get_it/get_it.dart';

import '../../features/authentication/login/data/repo/login_repo.dart';
import '../../features/authentication/login/data/repo/login_repo_impl.dart';
import '../../features/authentication/register/data/repo/register_repo.dart';
import '../../features/authentication/register/data/repo/register_repo_impl.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<LoginRepo>(LoginRepoImpl());
  getIt.registerSingleton<RegisterRepo>(
      RegisterRepoImpl());
}