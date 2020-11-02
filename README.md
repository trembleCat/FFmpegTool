
介绍
---
FFmpeg 使用工具 
  
- 请先集成FFmpeg才能使用该工具 
- 集成方法： 

1.在Link Binary With Libraries 里添加
- libz.tbd
- libbz2.tbd
- libiconv.tbd
- CoreMedia.framework
- VideoToolbox.framework
- AVFoundation.framework

2.将 【FFmpeg-iOS】 文件夹导入到项目中 
 
3.设置 Header Search Paths 路径，为项目【FFmpeg-iOS】 文件夹中的 【include】文件夹

功能范围
---
- 通过字符串使用 FFmpeg
- 通过字符串数组使用 FFmpeg
- 通过 FFmpegType 类型数组使用 FFmpeg

代码使用及注意
---
```objective-c
/// Be careful BundlePath and DocumentPath and @" "  -   注意文件路径与空格

        NSString *inputFilePath = FBundlePath(@"inputVideo.MP4");
        NSString *outputFilePath = FDocumentPath(@"outputVideo.mkv");

        NSString *ffmpegString = [NSString stringWithFormat: @"ffmpeg -i %@ %@",inputFilePath,outputFilePath];
        // ffmpeg -i inputVideo.MP4 outputVideo.mkv

        [FFmpegTool ffmpegWithString:ffmpegString];

/// - Parameter NSString *:

+ (void)ffmpegWithString:(NSString *)str;
```
```swift
/// Be careful BundlePath and DocumentPath   -   注意文件路径

        let ffmpegAry: [FFmpegType] = [.ffmpeg, ._i, .bundle(with: "inputVideo.MP4") .document(with: "outputVideo.mkv")]
        // ffmpeg -i inputVideo.MP4 outputVideo.mkv

        // let ffmpegAry: [FFmpegType] = [.ffmpeg, ._i, .bundle(with: "inputVideo.MP4"), .document(with: "outputImage%03d.png")]
        // ffmpeg -i inputVideo.MP4 outputImage%03d.png

        FFmpegTool.startFFmpeg(withAry: ffmpegAry)

/// Set other property  -  设置其他属性时

        let setpts: FFmpegType = .init(value: "\"setpts=0.5*PTS\"") or
        let timer: FFmpegType = .init(value: "00:00:03") or
        let bit: FFmpegType = .init(value: "320k")

/// - Parameter NSArray<FFmpegType *> *:
        let ffmpegAry = [FFmpegType]()

+ (void)ffmpegWithTypeAry:(NSArray<FFmpegType *> *)ary;
```
````objective-c
/// Be careful BundlePath and DocumentPath   -   注意文件路径

        NSString *inputFilePath = FBundlePath(@"inputVideo.MP4");
        NSString *outputFilePath = FDocumentPath(@"outputVideo.mkv");

        [FFmpegTool ffmpegWithStringAry: @[@"ffmpeg", @"-i", inputFilePath, outputFilePath]];
        // ffmpeg -i inputVideo.MP4 outputVideo.mkv

/// - Parameter NSArray<NSString *> *:
        @[@"ffmpeg", @"-i", inputFilePath, outputFilePath];

+ (void)ffmpegWithStringAry:(NSArray<NSString *> *)ary;
```
