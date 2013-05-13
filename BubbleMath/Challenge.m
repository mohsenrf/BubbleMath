//
//  Challenge.m
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 12/05/13.
//
//

#import "Challenge.h"

@implementation Challenge
//@synthesize secondOperand,question,answer;

- (int) getRandomNumberForLevel: (ChallengeLevel) level
{
    
    return (0 + arc4random() % (level));
    
}

- (NSString *) getQuestionWithLevel: (ChallengeLevel) level withFunction: (int) functionType
{
    
    _firstOperand = [self getRandomNumberForLevel:level];
    _secondOperand = [self getRandomNumberForLevel:level];
    _question=([NSString stringWithFormat:@"%@ + %@", [NSString stringWithFormat:@"%i", _firstOperand], [NSString stringWithFormat:@"%i", _secondOperand]]);
    _answer = [NSString stringWithFormat:@"%i", (_firstOperand + _secondOperand)];
    
    return _question;
    
}

- (NSString *) getChallenge: (ChallengeLevel) level withFunction: (int) functionType
{
    NSString *myString= [self getQuestionWithLevel:level withFunction:functionType];
    return myString;
    
}

@end
