//
//  ViewController.h
//  HighRoll
//
//  Created by DetroitLabs on 5/25/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopScore.h"

@interface ViewController : UIViewController

@property(nonatomic) int balance;
@property(nonatomic) BOOL aboveOrBelow;
@property(nonatomic) int aboveOrBelowNumber;
@property(nonatomic) int dieOne;
@property(nonatomic) int dieTwo;
@property(nonatomic) int diceTotal;
@property(nonatomic) int bet;
@property(nonatomic) int rollCount;
@property(nonatomic, strong) TopScore *topScore;




@end

