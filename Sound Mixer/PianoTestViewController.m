//
//  PianoTestViewController.m
//  Sound Mixer
//
//  Created by Chen Zhibo on 10/4/15.
//  Copyright © 2015 Chen Zhibo. All rights reserved.
//

#import "PianoTestViewController.h"
#import "Note.h"
#import "Score.h"
#import "SheetMusic.h"
#import "Piano.h"
#import "MusicComposer.h"

@interface PianoTestViewController ()

@end

@implementation PianoTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    SheetMusic *sm = [[[MusicComposer alloc] init] composeMusicForBaseNotename:@"3G"];
    
//// MANUALLY
//    [[SheetMusic alloc] init];
//    int i = 3;
//    [sm.scores addObject:[Score scoreWithNotename:@"3C" playtime:1 * i]];
//    [sm.scores addObject:[Score scoreWithNotename:@"2E" playtime:2 * i]];
//    [sm.scores addObject:[Score scoreWithNotename:@"4E" playtime:2 * i]];
//    [sm.scores addObject:[Score scoreWithNotename:@"1E" playtime:2 * i]];
//    [sm.scores addObject:[Score scoreWithNotename:@"3G" playtime:3 * i]];
//    [sm.scores addObject:[Score scoreWithNotename:@"4C" playtime:4 * i]];
    
    Piano *piano = [[Piano alloc] init];
    piano.sheetMusic = sm   ;
    [piano play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
