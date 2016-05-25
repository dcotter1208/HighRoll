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
@property (weak, nonatomic) IBOutlet UIStepper *betStepper;


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
    _bet = 10;
    _aboveOrBelowNumber = [self randomize:4 max:8];
    _aboveOrBelowNumberLabel.text = [NSString stringWithFormat:@"%i", _aboveOrBelowNumber];
    _balanceLabel.text = [NSString stringWithFormat:@"Balance: $%i", _balance];
    _totalBetLabel.text = [NSString stringWithFormat:@"Total bet: $%i", _bet ];
    
}

- (int)randomize:(int)min max:(int)max {
    return min + arc4random_uniform(max - min + 1);
}


- (void) checkIfAboveOrBelow{
    
    if (_diceTotal == _aboveOrBelowNumber) {
        NSLog(@"PUUUUUUUSSSSHHHHHHH");
    } else if (_belowOrAboveSegmentedControl.selectedSegmentIndex == 0 && _diceTotal < _aboveOrBelowNumber) {
        _balance += _bet;
        _balanceLabel.text = [NSString stringWithFormat:@"Balance: $%i", _balance];
        NSLog(@"dice total: %i, aboveOrBelowNum: %i", _diceTotal, _aboveOrBelowNumber);
        NSLog(@"You WON!");
    } else if (_belowOrAboveSegmentedControl.selectedSegmentIndex == 1 && _diceTotal > _aboveOrBelowNumber) {
        _balance += _bet;
        _balanceLabel.text = [NSString stringWithFormat:@"Balance: $%i", _balance];
        NSLog(@"dice total: %i, aboveOrBelowNum: %i", _diceTotal, _aboveOrBelowNumber);
        NSLog(@"You WON!");
    } else {
        _balance -= _bet;
        _balanceLabel.text = [NSString stringWithFormat:@"Balance: $%i", _balance];
        NSLog(@"dice total: %i, aboveOrBelowNum: %i", _diceTotal, _aboveOrBelowNumber);
        NSLog(@"you lose");
    }

}


- (IBAction)betIncrementDecrement:(id)sender {
    if (_totalBetSegmentedControl.selectedSegmentIndex == 1 && _bet <= _balance ){
        
        _bet +=10;
        _totalBetLabel.text = [NSString stringWithFormat:@"Total bet: $%i", _bet ];
        
    } else if (_totalBetSegmentedControl.selectedSegmentIndex == 0 && _bet >= 10){
        _bet -=10;
        _totalBetLabel.text = [NSString stringWithFormat:@"Total bet: $%i", _bet ];
    
    }

    
}

-(void)determineDieImage:(int)dieNum {

    switch (dieNum) {
        case 1:
//            one
            break;
            
        default:
            break;
    }
    
}

- (IBAction)betIncrementAndDecrement:(UIStepper *)sender {
    
    if (sender.value >=10 && sender.value <= _balance){
        _bet = sender.value;
        _totalBetLabel.text = [NSString stringWithFormat:@"Total bet: $%i", _bet ];
        
    }
}


- (IBAction)rollButtonPressed:(id)sender {
    _dieOne = [self randomize:1 max:6];
    _dieTwo = [self randomize:1 max:6];
    _diceTotal = _dieOne + _dieTwo;
    [self checkIfAboveOrBelow];

    
}






@end
