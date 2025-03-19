# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Keep your model classes
-keep class com.plastic2fuel.app.models.** { *; }

# Keep Gson stuff
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.** { *; }

# Keep Retrofit stuff
-keepattributes Signature
-keepattributes *Annotation*
-keep class retrofit2.** { *; }
-keepattributes Exceptions

# Keep your custom classes
-keep class com.plastic2fuel.app.** { *; }

# Keep Google Play Core Library classes
-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }
-keep class com.google.android.play.core.** { *; }

# Keep all classes in com.google.android.play.core
-dontwarn com.google.android.play.core.** 