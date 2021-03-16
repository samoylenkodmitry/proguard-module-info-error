# proguard-module-info-error
Simple little project that reproduce proguard error when importing a 3rd party library that have explicit rule to keep some other dependencies

Trying to investigate the issue with module-info.class error https://community.guardsquare.com/t/cant-compile-android-jackson-duplicate-module-info-class/596/9

#What is this error?
```
> java.io.IOException: Can't write [/home/s/develop/projects/proguardjacksonbug/app/build/intermediates/shrunk_jar/release/minified.jar] (Can't read [/home/s/.gradle/caches/transforms-3/35c01c5e85c40499062c3cbb1975ab06/transformed/jetified-jackson-databind-2.12.1.jar(;;;;;;;;**.class)] (Duplicate jar entry [module-info.class]))


```
#What is the reason?
Some of your dependencies have `module-info.class` in them. 

Normally proguard skip them. But if you wrongly write `-keep` rule that is too broad and keeps all package members then proguard will try to merge thos `module-info.class` files into ouput jar and fail.

#But what if my keep rules are correct?
Then you need to investigate resulting proguard rules that all your dependencies attached with them.

You can do it by placing 
```
-printconfiguration fullconfig.pro
```
in your `proguard-rules.pro`.
