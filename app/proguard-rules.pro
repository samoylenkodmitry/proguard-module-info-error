-verbose
-printconfiguration fullconfig.pro

-dontobfuscate
-optimizationpasses 1

-keep class com.fasterxml.**
-keep class com.thirdegg.**
-keep class com.example.**

-dontwarn com.yandex.**
-dontwarn ru.mobileup.**
-dontwarn ru.vitrina.**
-dontwarn com.google.**
-dontwarn javax.xml.**
-dontwarn org.slf4j.**
-dontwarn com.fasterxml.jackson.databind.**