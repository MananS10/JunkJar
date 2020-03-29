class User {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;

  User({
    this.uid,
    this.name,
    this.email,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
      };

  User.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        name = json['name'],
        email = json['email'],
        photoUrl = json['photoUrl'];
}
