//
//  TopScore.m
//  HighRoll
//
//  Created by DetroitLabs on 5/25/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "TopScore.h"

@implementation TopScore

-(id)initWithplayerNameAndScore:(NSString *)playerName score:(int)score {
    self = [super init];
    
    if (self) {
        _playerName = playerName;
        _score = score;
    }
    return self;
}



@end
