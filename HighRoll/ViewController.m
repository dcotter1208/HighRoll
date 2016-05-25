//
//  ViewController.m
//  HighRoll
//
//  Created by DetroitLabs on 5/25/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *balanceLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *belowOrAboveSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *totalBetLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *totalBetSegmentedControl;
@property (weak, nonatomic) IBOutlet UIImageView *dieOneImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dieTwoImageView;
@property (weak, nonatomic) IBOutlet UILabel *aboveOrBelowNumberLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self startGame];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startGame {
    _balance = 100;
    _rollCount = 1;
    _aboveOrBelowNumber = [self randomize:4 max:8];
    self.aboveOrBelowNumberLabel.text = [NSString stringWithFormat:@"%i", _aboveOrBelowNumber];
    //NSLog(@"aboveOrBelowNumber = %i", _aboveOrBelowNumber);
}

- (int)randomize:(int)min max:(int)max {
    return min + arc4random_uniform(max - min + 1);
}


- (void) checkIfAboveOrBelow{
    
    if (_diceTotal == _aboveOrBelowNumber) {
        NSLog(@"PUUUUUUUSSSSHHHHHHH");
    } else if (_belowOrAboveSegmentedControl.selectedSegmentIndex == 0 && _diceTotal < _aboveOrBelowNumber) {
        NSLog(@"dice total: %i, aboveOrBelowNum: %i", _diceTotal, _aboveOrBelowNumber);
        NSLog(@"You WON!");
    } else if (_belowOrAboveSegmentedControl.selectedSegmentIndex == 1 && _diceTotal > _aboveOrBelowNumber) {
        NSLog(@"dice total: %i, aboveOrBelowNum: %i", _diceTotal, _aboveOrBelowNumber);
        NSLog(@"You WON!");
    } else {
        NSLog(@"dice total: %i, aboveOrBelowNum: %i", _diceTotal, _aboveOrBelowNumber);
        NSLog(@"you lose");
    }

}





- (IBAction)rollButtonPressed:(id)sender {
    _dieOne = [self randomize:1 max:6];
    _dieTwo = [self randomize:1 max:6];
    _diceTotal = _dieOne + _dieTwo;
    [self checkIfAboveOrBelow];
    //NSLog(@"dieOne = %i, dieTwo = %i", _dieOne, _dieTwo);
    
}






@end
