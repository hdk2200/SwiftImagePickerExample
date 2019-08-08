# SwiftImagePickerExample
Swift UIImagePickerController usage example.

![Swift UIImagePickerController usage example](assets/app.jpg "Swift UIImagePickerController usage example")


# Reference

UIImagePickerController - UIKit | Apple Developer Documentation
https://developer.apple.com/documentation/uikit/uiimagepickercontroller

# UIImagePickerControllerSourceType

- **Info.plist should contain an NSPhotoLibraryUsageDescription key** 

- On iOS10 ,Info.plist have to contain an NSPhotoLibraryUsageDescription key.

```debug console
This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSPhotoLibraryUsageDescription key with a string value explaining to the user how the app uses this data.
```

- On iOS11 above, NSPhotoLibraryUsageDescription is not nessesary. But it is necessary when accessing PHAsset.

```Info.plist
    <key>NSPhotoLibraryUsageDescription</key>
    <string>To select photos.</string>
```

> Create a great user experience in your apps. And third, give a higher level of privacy to our users. So, I&apos;m happy to announce that in iOS 11, this alert is no longer needed. It just works.  
>[What's New in Photos APIs - WWDC 2017 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2017-505/?time=232)

## photoLibrary

```Swift
imagePicker.sourceType = .photoLibrary
```

![UIImagePickerController album selecting](assets/selectalbum.jpg "UIImagePickerController album selecting")

![UIImagePickerController picture list](assets/picturelist.jpg "UIImagePickerController  picture list")

## savedPhotosAlbum

```Swift
imagePicker.sourceType = .savedPhotosAlbum
```

Moments are displayed and selected immediately with a photo tap.

![UIImagePickerController savedPhotosAlbum](assets/savedPhotosAlbum.jpg "UIImagePickerController  savedPhotosAlbum")


## camera

```Swift
imagePicker.sourceType = .camera
```

- **Crash on simulator because simulator has no camera.**

```debug console
2019-08-08 11:31:03.169802+0900 SwiftImagePickerExample[18156:18504790] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'Source type 1 not available'
```

- **Info.plist must contain an NSCameraUsageDescription key** 

```debug console
2019-08-08 11:33:26.168085+0900 SwiftImagePickerExample[10477:2605004] [access] This app has crashed because it attempted to access privacy-sensitive data without a usage description.  The app's Info.plist must contain an NSCameraUsageDescription key with a string value explaining to the user how the app uses this data.
```

```Info.plist
    <key>NSCameraUsageDescription</key>
    <string>To take a picture.</string>
```

![UIImagePickerController camera](assets/camera.jpg "UIImagePickerController  camera")

## UIImagePickerController.InfoKey

UIImagePickerControllerDelegate didFinishPickingMediaWithInfo delegate method notify  UIImagePickerController.InfoKey dictionary.

UIImagePickerController.InfoKey contains following keys.

``` UIImagePickerControllerDelegate didFinishPickingMediaWithInfo info
info[UIImagePickerControllerImageURL] = file:///Users/username/Library/Developer/CoreSimulator/Devices/FBFFBD28-EDAD-4FBE-963C-64CAEF8C6326/data/Containers/Data/Application/ACF62CEC-6863-46B7-A2E6-353B6499ADBB/tmp/1BEECF23-3D21-4F74-BD39-FAA5ABB2BD2D.jpeg
info[UIImagePickerControllerMediaType] = public.image
info[UIImagePickerControllerOriginalImage] = <UIImage: 0x60000228d650> size {4838, 3831} orientation 0 scale 1.000000
info[UIImagePickerControllerReferenceURL] = assets-library://asset/asset.JPG?id=EB354110-0C47-4F69-AC62-861C4F9C50EF&ext=JPG
```
