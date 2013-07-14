//
//  SGViewController.h
//  Simple Game
//
//  Created by Adam Decker on 13 Jul 13.
//  Copyright (c) 2013 AdamMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MAX_GAME_LENGTH 60

@interface SGViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreBoard;
- (IBAction)buttonPressed:(UIButton *)sender;
@property NSInteger score;
@property NSTimer* gameTimer;
@property NSInteger gameTimeRemainign;
@property (weak, nonatomic) IBOutlet UITextField *gameOverLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *punchButtons;

@end
