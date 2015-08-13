////
////  ViewController.m
////  Sound Mixer
////
////  Created by Chen Zhibo on 2/5/15.
////  Copyright (c) 2015 Chen Zhibo. All rights reserved.
////
//
//#import "ViewController.h"
//#import "MainScene.h"
//
//@import AVFoundation;
//@import SpriteKit;
//
//@interface ViewController ()
//
//@property (strong, nonatomic) AVPlayer * player;
//
//@property (strong, nonatomic) NSMutableArray *players;
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    SKView *view = [[SKView alloc] initWithFrame:self.view.frame];
//    self.view = view;
//    SKScene *scene = [[MainScene alloc] initWithSize:self.view.frame.size];
//    [view presentScene:scene];
//    
//   
//}
//
//- (NSURL *)urlWithGivenFileNumber:(NSInteger)fileNumber
//{
//    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *fileName = [NSString stringWithFormat:@"%ld", (long)fileNumber];
//    //NSString *path = [bundle pathForResource:fileName ofType:@".aif"];
//    NSURL *url = [bundle URLForResource:fileName withExtension:@".mp3"];
//    return url;
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//    
//}
//
//@end
