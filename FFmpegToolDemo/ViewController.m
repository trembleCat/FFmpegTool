//
//  ViewController.m
//  FFmpegToolDemo
//
//  Created by 发抖喵 on 2020/6/17.
//  Copyright © 2020 发抖喵. All rights reserved.
//

#import "ViewController.h"

#import "avformat.h"
#import "avfilter.h"
#import "buffersrc.h"
#import "swresample.h"

#import "FFmpegTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *inputFilePath = [FFmpegType bundleWith:@"inputVideo.MP4"].value;
    NSString *outputFilePath = [FFmpegType documentWith:@"outputVideo.mkv"].value;
    
    [FFmpegTool ffmpegWithStringAry: @[@"ffmpeg", @"-i", inputFilePath, outputFilePath]];
//    [FFmpegTool ffmpegWithString:[NSString stringWithFormat:@"ffmpeg -i %@ %@", inputFilePath, outputFilePath]];
    
}


@end
