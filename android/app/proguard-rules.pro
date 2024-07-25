# Keep rules to avoid R8 errors
-keep class android.window.BackEvent { *; }
-keep class io.flutter.view.** { *; }
-keep class android.window.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class com.google.android.** { *; }

# Suppress warnings about missing classes
-dontwarn android.window.**
-dontwarn android.window.BackEvent
-dontwarn com.android.org.conscrypt.SSLParametersImpl