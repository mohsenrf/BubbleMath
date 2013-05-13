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

- (NSString *) getQuestionWithLevel: (ChallengeLevel) level withFunction: (FunctionType) functionType
{
    _firstOperand = [self getRandomNumberForLevel:level];
    _secondOperand = [self getRandomNumberForLevel:level];
    
    switch (functionType) {
        case Addition:
            
            _question=([NSString stringWithFormat:@"%@ + %@", [NSString stringWithFormat:@"%i", _firstOperand], [NSString stringWithFormat:@"%i", _secondOperand]]);
            _answer = [NSString stringWithFormat:@"%i", (_firstOperand + _secondOperand)];
            
            break;
            
        case Subtraction:
            _question=([NSString stringWithFormat:@"%@ - %@", [NSString stringWithFormat:@"%i", _firstOperand], [NSString stringWithFormat:@"%i", _secondOperand]]);
            _answer = [NSString stringWithFormat:@"%i", (_firstOperand - _secondOperand)];
            break;
            
        case Multiplication:
            _question=([NSString stringWithFormat:@"%@ * %@", [NSString stringWithFormat:@"%i", _firstOperand], [NSString stringWithFormat:@"%i", _secondOperand]]);
            _answer = [NSString stringWithFormat:@"%i", (_firstOperand * _secondOperand)];
            break;
            
        case Division:
            _question=([NSString stringWithFormat:@"%@ / %@", [NSString stringWithFormat:@"%i", _firstOperand], [NSString stringWithFormat:@"%i", _secondOperand]]);
            _answer = [NSString stringWithFormat:@"%i", (_firstOperand / _secondOperand)];
            break;
            
        default:
            break;
    }
    
    
    
    
    
    return _question;
    
}

- (NSString *) getChallenge: (ChallengeLevel) level withFunction: (FunctionType) functionType
{
    NSString *myString= [self getQuestionWithLevel:level withFunction:functionType];
    return myString;
    
}

@end
