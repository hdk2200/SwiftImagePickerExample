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

### UIImagePickerController.InfoKey

UIImagePickerControllerDelegate didFinishPickingMediaWithInfo delegate method notify  UIImagePickerController.InfoKey dictionary.

UIImagePickerController.InfoKey contains following keys.

``` UIImagePickerControllerDelegate didFinishPickingMediaWithInfo info
info[UIImagePickerControllerImageURL] = file:///Users/username/Library/Developer/CoreSimulator/Devices/FBFFBD28-EDAD-4FBE-963C-64CAEF8C6326/data/Containers/Data/Application/ACF62CEC-6863-46B7-A2E6-353B6499ADBB/tmp/1BEECF23-3D21-4F74-BD39-FAA5ABB2BD2D.jpeg
info[UIImagePickerControllerMediaType] = public.image
info[UIImagePickerControllerOriginalImage] = <UIImage: 0x60000228d650> size {4838, 3831} orientation 0 scale 1.000000
info[UIImagePickerControllerReferenceURL] = assets-library://asset/asset.JPG?id=EB354110-0C47-4F69-AC62-861C4F9C50EF&ext=JPG
```

## savedPhotosAlbum

```Swift
imagePicker.sourceType = .savedPhotosAlbum
```

Moments are displayed and selected immediately with a photo tap.

![UIImagePickerController savedPhotosAlbum](assets/savedPhotosAlbum.jpg "UIImagePickerController  savedPhotosAlbum")


### UIImagePickerController.InfoKey

```
info[UIImagePickerControllerReferenceURL] = assets-library://asset/asset.HEIC?id=9249743F-CBFF-4AC3-9578-AB9CC266F13E&ext=HEIC
info[UIImagePickerControllerMediaType] = public.image
info[UIImagePickerControllerImageURL] = file:///private/var/mobile/Containers/Data/Application/4C0E6A40-2A8F-4CEB-8E61-8C46C9C9BC8A/tmp/3041068D-6576-47FB-AE71-6C5AAA22ECD3.jpeg
info[UIImagePickerControllerOriginalImage] = <UIImage: 0x2829dd1f0> size {4032, 3024} orientation 1 scale 1.000000
```

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

### UIImagePickerController.InfoKey

```
info[UIImagePickerControllerMediaType] = public.image
info[UIImagePickerControllerMediaMetadata] = {
    DPIHeight = 72;
    DPIWidth = 72;
    Orientation = 6;
    kCGImageDestinationICCProfile = <00000224 6170706c 04000000 6d6e7472 52474220 58595a20 07e10007 0007000d 00160020 61637370 4150504c 00000000 4150504c 00000000 00000000 00000000 00000000 0000f6d6 00010000 0000d32d 6170706c ca1a9582 257f104d 389913d5 d1ea1582 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000000a 64657363 000000fc 00000065 63707274 00000164 00000023 77747074 00000188 00000014 7258595a 0000019c 00000014 6758595a 000001b0 00000014 6258595a 000001c4 00000014 72545243 000001d8 00000020 63686164 000001f8 0000002c 62545243 000001d8 00000020 67545243 000001d8 00000020 64657363 00000000 0000000b 44697370 6c617920 50330000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 74657874 00000000 436f7079 72696768 74204170 706c6520 496e632e 2c203230 31370000 58595a20 00000000 0000f351 00010000 000116cc 58595a20 00000000 000083df 00003dbf ffffffbb 58595a20 00000000 00004abf 0000b137 00000ab9 58595a20 00000000 00002838 0000110b 0000c8b9 70617261 00000000 00030000 00026666 0000f2a7 00000d59 000013d0 00000a5b 73663332 00000000 00010c42 000005de fffff326 00000793 0000fd90 fffffba2 fffffda3 000003dc 0000c06e>;
    "{Exif}" =     {
        ApertureValue = "1.6959938131099";
        BrightnessValue = "2.47190610666908";
        ColorSpace = 65535;
        DateTimeDigitized = "2019:08:08 14:39:59";
        DateTimeOriginal = "2019:08:08 14:39:59";
        ExposureBiasValue = 0;
        ExposureMode = 0;
        ExposureProgram = 2;
        ExposureTime = "0.06666666666666667";
        FNumber = "1.8";
        Flash = 24;
        FocalLenIn35mmFilm = 28;
        FocalLength = "3.99";
        ISOSpeedRatings =         (
            40
        );
        LensMake = Apple;
        LensModel = "iPhone 8 back camera 3.99mm f/1.8";
        LensSpecification =         (
            "3.99",
            "3.99",
            "1.8",
            "1.8"
        );
        MeteringMode = 5;
        PixelXDimension = 4032;
        PixelYDimension = 3024;
        SceneType = 1;
        SensingMethod = 2;
        ShutterSpeedValue = "3.907099801557246";
        SubjectArea =         (
            2015,
            1511,
            2217,
            1330
        );
        SubsecTimeDigitized = 547;
        SubsecTimeOriginal = 547;
        WhiteBalance = 0;
    };
    "{MakerApple}" =     {
        1 = 10;
        12 =         (
            "14.31640625",
            "14.6171875"
        );
        13 = 16;
        14 = 0;
        15 = 2;
        16 = 1;
        2 = <3b01df01 e301f000 12000800 09004f00 5f005d00 5d005e00 5e005d00 59005400 8801db01 ec01f501 9d016b00 17006a00 62006000 60006000 61006000 5c005800 b301cf01 df01e401 e101a801 ad007300 67006500 64006400 63006200 61005d00 af01c501 cf01d101 c6018501 ba008200 73006c00 6a006800 67006600 65006200 a401b701 bf01be01 ab016901 b6008700 7c007300 6f006d00 6c006b00 69006700 9801a801 ad01ab01 93015601 c0008900 80007800 74007100 6f006e00 6d006b00 89019a01 9d019601 7e014801 cb008900 82007c00 77007400 73007100 70006e00 75018801 8c018401 6d013e01 d7008b00 83007e00 79007600 75007400 73007100 5e017501 7b017401 5f013601 df009000 84008000 7c007900 77007700 76007500 46015f01 6a016501 55012e01 e3009700 85008200 7e007b00 79007800 78007700 2c014901 56015601 4b012701 e7009f00 86008300 7f007d00 7c007a00 79007800 0f013101 42014501 43012101 e900a800 86008400 81007f00 7e007c00 7b007900 e1001701 2c013601 39011b01 e900b000 89008500 83008100 80008000 7d007c00 7a00f300 15012601 2c011401 ea00b800 8e008700 86008500 83008200 81007d00 2800af00 f8001401 1f010c01 e900bc00 94008900 89008800 86008500 83008000 4e004200 d100fe00 0f010101 e700bf00 9b008c00 8c008b00 8a008800 84008200>;
        20 = 5;
        23 = 0;
        25 = 0;
        3 =         {
            epoch = 0;
            flags = 1;
            timescale = 1000000000;
            value = 551795141700000;
        };
        31 = 0;
        33 = 0;
        37 = 0;
        38 = 0;
        39 = 0;
        4 = 1;
        5 = 189;
        6 = 196;
        7 = 1;
        8 =         (
            "0.05074068531394005",
            "-0.4003228545188904",
            "-0.9228063821792603"
        );
    };
    "{TIFF}" =     {
        DateTime = "2019:08:08 14:39:59";
        Make = Apple;
        Model = "iPhone 8";
        ResolutionUnit = 2;
        Software = "12.4";
        XResolution = 72;
        YResolution = 72;
    };
}
info[UIImagePickerControllerOriginalImage] = <UIImage: 0x2829d9b20> size {3024, 4032} orientation 3 scale 1.000000
```
