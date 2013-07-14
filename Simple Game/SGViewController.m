//
//  SGViewController.m
//  Simple Game
//
//  Created by Adam Decker on 13 Jul 13.
//  Copyright (c) 2013 AdamMartin. All rights reserved.
//

#import "SGViewController.h"

@interface SGViewController ()

@end

@implementation SGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.score = 0;
    
    [self updateLabel];
    
    self.gameTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.gameTimer forMode:NSDefaultRunLoopMode];
    self.gameTimeRemainign = MAX_GAME_LENGTH;
    self.timerLabel.text = [NSString stringWithFormat:@"%d", self.gameTimeRemainign];
    
    NSInteger randomButtonIndex = arc4random_uniform(self.punchButtons.count);
    UIButton *buttonView = [self.punchButtons objectAtIndex:randomButtonIndex];
    buttonView.hidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"yay!!!");
    
    self.score++;
    [self updateLabel];
}

- (void) updateLabel {
    self.scoreBoard.text = [NSString stringWithFormat:@"%d", self.score];
}

- (void)timerFired:(NSTimer*)timer {
    self.gameTimeRemainign--;
    self.timerLabel.text = [NSString stringWithFormat:@"%d", self.gameTimeRemainign];
    if (self.gameTimeRemainign == 0) {
        [self.gameTimer invalidate];
        self.gameOverLabel.hidden = NO;
        [self.punchButtons enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL *stop) {
            obj.hidden = YES;
        }];
    }
}
@end
