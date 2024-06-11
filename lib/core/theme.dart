import "package:flutter/material.dart";

class MaterialTheme {
  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4279528277),
      surfaceTint: Color(4279528277),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288934614),
      onPrimaryContainer: Color(4278198552),
      secondary: Color(4283130714),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291750365),
      onSecondaryContainer: Color(4278722584),
      tertiary: Color(4282409846),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291094782),
      onTertiaryContainer: Color(4278197804),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294310902),
      onBackground: Color(4279704858),
      surface: Color(4294310902),
      onSurface: Color(4279704858),
      surfaceVariant: Color(4292601311),
      onSurfaceVariant: Color(4282337605),
      outline: Color(4285561204),
      outlineVariant: Color(4290759107),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086511),
      inverseOnSurface: Color(4293718766),
      inversePrimary: Color(4287157947),
      primaryFixed: Color(4288934614),
      onPrimaryFixed: Color(4278198552),
      primaryFixedDim: Color(4287157947),
      onPrimaryFixedVariant: Color(4278210879),
      secondaryFixed: Color(4291750365),
      onSecondaryFixed: Color(4278722584),
      secondaryFixedDim: Color(4289907905),
      onSecondaryFixedVariant: Color(4281617475),
      tertiaryFixed: Color(4291094782),
      onTertiaryFixed: Color(4278197804),
      tertiaryFixedDim: Color(4289252322),
      onTertiaryFixedVariant: Color(4280765277),
      surfaceDim: Color(4292205527),
      surfaceBright: Color(4294310902),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916144),
      surfaceContainer: Color(4293521387),
      surfaceContainerHigh: Color(4293192421),
      surfaceContainerHighest: Color(4292797663),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278209851),
      surfaceTint: Color(4279528277),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281500267),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281354303),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284578416),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280502105),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283922829),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294310902),
      onBackground: Color(4279704858),
      surface: Color(4294310902),
      onSurface: Color(4279704858),
      surfaceVariant: Color(4292601311),
      onSurfaceVariant: Color(4282139969),
      outline: Color(4283982173),
      outlineVariant: Color(4285758840),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086511),
      inverseOnSurface: Color(4293718766),
      inversePrimary: Color(4287157947),
      primaryFixed: Color(4281500267),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279199827),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284578416),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282999128),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283922829),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282278003),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205527),
      surfaceBright: Color(4294310902),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916144),
      surfaceContainer: Color(4293521387),
      surfaceContainerHigh: Color(4293192421),
      surfaceContainerHighest: Color(4292797663),
    );
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        cardTheme: CardTheme(
          color: MaterialTheme.lightScheme().primaryFixed,
          elevation: 15,
          shadowColor: MaterialTheme.lightScheme().secondary,
        ),
        appBarTheme: AppBarTheme(
          shadowColor: MaterialTheme.lightScheme().secondary,
          backgroundColor: MaterialTheme.lightScheme().primary,
          elevation: 7,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              MaterialTheme.lightMediumContrastScheme()
                  .primary
                  .withOpacity(.75),
            ),
          ),
        ),
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
