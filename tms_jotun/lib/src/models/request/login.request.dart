class LoginRequest {
  final String username;
  final String password;
  final String action;

  LoginRequest({
    required this.username,
    required this.password,
    this.action = 'force-logout',
  });

  // Method untuk mengonversi instance ke JSON, cocok untuk body request
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'action': action,
    };
  }
}
