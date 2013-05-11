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

- (int) getRandomNumberForLevel: (int) level
{
    
    return (0 + arc4random() % (level));
    
}

- (NSString *) getQuestionWithLevel: (int) level withFunction: (int) functionType
{

    
    _firstOperand = [self getRandomNumberForLevel:level];
    _secondOperand = [self getRandomNumberForLevel:level];
    
    return ([NSString stringWithFormat:@"%@ + %@", [NSString stringWithFormat:@"%i", _firstOperand], [NSString stringWithFormat:@"%i", _secondOperand]]);

    
}

- (NSString *) getChallenge: (int) level withFunction: (int) functionType
{
    NSString *myString= [self getQuestionWithLevel:level withFunction:functionType];
    return myString;

}




@end
