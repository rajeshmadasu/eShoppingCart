# eshopingcart


## Getting Started
eShoppingCartFlutter uses provider state management libraries 

- https://pub.dev/packages/provider

Consumer only rebuilds the widgets that are part of its builder, Provider.of() on the other hand triggers a complete re-build (i.e. re-runs build()) of this widget's widget tree.

What does Provider.of<SomeData>(context) NOT do?

	A) Provider.of<...> sets up a LISTENER to provided data, it does NOT provide data to other listeners itself.

What's a good example for local state which you would typically handle via a StatefulWidget instead of a provided object (i.e. instead of via the Provider package)?
	A)This is some state/ data that only matters to one (or a few) widgets. It certainly doesn't need to be managed globally.


Sending Http Requests: https://flutter.dev/docs/cookbook/networking/fetch-data


-> Implemented Pull to refresh in manage product screen
-> Added animation for AuthScreen using AnimationContainer for smooth transition

Custom shaped AppBar as seen in the “Bunny Search” app using SliverAppBar and SliverList , CustomerScrollView

https://medium.com/flutter-community/custom-shaped-appbar-as-seen-in-the-bunny-search-app-6312d067485c
https://medium.com/flutter-community/basics-of-neumorphism-in-flutter-f4d678ef08d1






Generate Apk file from aab file (android app bundle)

For Debug apk command,

bundletool build-apks --bundle=/MyApp/my_app.aab --output=/MyApp/my_app.apks
For Release apk command,

bundletool build-apks --bundle=/MyApp/my_app.aab --output=/MyApp/my_app.apks
--ks=/MyApp/keystore.jks
--ks-pass=file:/MyApp/keystore.pwd
--ks-key-alias=MyKeyAlias
--key-pass=file:/MyApp/key.pwd

To generate different apks from release aab 

java -jar "bundletool.jar" build-apks --bundle=C:\FlutterWorkspace\eshopingcart\build\app\outputs\bundle\release\app-release.aab --output=C:\FlutterWorkspace\eshopingcart/shoppye_release.apks --ks="C:\FlutterWorkspace\eshopingcart\android\upload-keystore.jks" --ks-pass=pass:rajesh --ks-key-alias=upload --key-pass=pass:rajesh

https://stackoverflow.com/questions/53040047/generate-apk-file-from-aab-file-android-app-bundle


Thanks Freepick for illustrations
https://www.freepik.com/free-vector/https://www.freepik.com/free-vector/black-friday-concept-illustration_10307453.htm

Generate Splash screen from images
https://pgicons.abiro.com/


Reference:
<img src="https://raw.githubusercontent.com/rajeshmadasu/eShoppingCartFlutter/main/screenshots/login_page.png"  width="160" height="300" />
