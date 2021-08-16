# test_back_norif

A new Flutter project.

## To Change Notification Icon
1. Create your mipmap notification icon. You can do this easily using Roman's Notification Icon Generator - Click on "Notification Icon Generator (Found Here)["https://romannurik.github.io/AndroidAssetStudio/icons-notification.html#source.type=clipart&source.clipart=ac_unit&source.space.trim=1&source.space.pad=0&name=ic_stat_ac_unit"]

2. On the left panel, click "Image" to upload your own image or use ClipArt or text as provided.

3. After you're done, click the download button in the upper-right to download the zip file.

4. In the zip file, your icon files will be in individual directories with the same name as your mipmap directories in your project directory (e.g., "mipmap-hdpi", "mipmap-mdpi", etc.). Move the icon files to their respective folders within your project.

5. In your AndroidManifest.xml file (located at android/app/src/main/AndroidManifest.xml), add the meta-data within the "application" tag:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.your.package">

    <application
        android:name="com.your.package.Application"
        android:label="YourAppName"
        android:icon="@mipmap/launcher_icon">

        <meta-data
          android:name="com.google.firebase.messaging.default_notification_icon"
          android:resource="@mipmap/your_icon_file_name" />
```
6. Save your file. You may need to stop and restart or uninstall and reinstall your app for the notification icon to start showing.

7. Your icon is probably white, so if you want to change the color you can add the following meta-data tag below the icon meta-data tag you just added:

```xml
 <meta-data
          android:name="com.google.firebase.messaging.default_notification_color"
          android:resource="@android:color/black" />
```
