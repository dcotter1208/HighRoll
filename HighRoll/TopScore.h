//
//  TopScore.h
//  HighRoll
//
//  Created by DetroitLabs on 5/25/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopScore : NSObject

@property(nonatomic, strong) NSString *playerName;
@property(nonatomic) int score;

-(id)initWithplayerNameAndScore:(NSString *)playerName score:(int)score;

@end
