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
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISlider *paceSlider;
@property (weak, nonatomic) IBOutlet UILabel *indicator;
@property (strong, nonatomic) Piano *piano;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation PianoTestViewController
- (IBAction)sliderValueChanged:(id)sender {
    self.indicator.text = [NSString stringWithFormat:@"%d\r\n Chapters", (int)self.slider.value];
}
- (IBAction)playOnce:(id)sender {
    if (self.piano.isplaying) {
        [self.piano stop];
        return;
    }
    SheetMusic *sm = [[[MusicComposer alloc] init] composeMusicForBaseNotename:@"3G"withNumberOfMainChapters:1];
    
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
    piano.duration = self.paceSlider.value;
    self.piano = piano;
    [piano play];
}

- (IBAction)play:(id)sender {
    if (self.piano.isplaying) {
        [self.piano stop];
        return;
    }
    SheetMusic *sm = [[[MusicComposer alloc] init] composeMusicForBaseNotename:
                      
                      //@"3G"
                      self.textField.text
                                                      withNumberOfMainChapters:(int)self.slider.value];
    
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
    piano.duration = self.paceSlider.value;
    self.piano = piano;
    [piano play];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self sliderValueChanged:self.slider];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
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
