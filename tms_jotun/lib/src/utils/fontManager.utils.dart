enum FontSize { xs, sm, normal, lg, xl, xl2, xl2_5, xl3, xl4, xl5 }

extension MyDoubleEnumExtension on FontSize {
  double get value {
    switch (this) {
      case FontSize.xs:
        return 12.0;
      case FontSize.sm:
        return 14.0;
      case FontSize.normal:
        return 16.0;
      case FontSize.lg:
        return 18.0;
      case FontSize.xl:
        return 20.0;
      case FontSize.xl2:
        return 24.0;
      case FontSize.xl2_5:
        return 28.0;
      case FontSize.xl3:
        return 30.0;
      case FontSize.xl4:
        return 36.0;
      case FontSize.xl5:
        return 48.0;
    }
  }
}
