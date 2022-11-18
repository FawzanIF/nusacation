part of 'extensions.dart';

extension FirebaseUserExtension on auth.User {
  UserModel convertToUser({
    String name = "No Name",
    List<String> selectedGenres = const [],
    int balance = 20,
  }) =>
      UserModel(
        this.uid,
        this.email!,
        name: name,
        balance: balance,
      );

  Future<UserModel> fromFireStore() async => await UserServices.getUser(this.uid);
}
