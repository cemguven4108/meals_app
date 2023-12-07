enum Navigations {
  Home,
  Favorites,
}

extension NavigationsExtension on Navigations {
  static const Map<Navigations, String> _map = {
    Navigations.Home: "/",
    Navigations.Favorites: "/favorites",
  };

  String get key => _map[this]!;
}
