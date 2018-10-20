class User{
  String name;
  String avatarUrl;
  User({this.name, this.avatarUrl}):assert(name!=null),assert(avatarUrl!=null);
}