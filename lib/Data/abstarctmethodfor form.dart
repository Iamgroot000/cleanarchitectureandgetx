import '../Domain/entities/formmodel.dart';

abstract class UserRepository {
  Future<void> registerUser(User user);
}
