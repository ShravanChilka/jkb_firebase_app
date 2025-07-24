class RegisterRequestModel {
  const RegisterRequestModel({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });

  final String name;
  final String username;
  final String email;
  final String password;
}
