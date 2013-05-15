//
//  Challenge.m
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 12/05/13.
//
//

#import "Challenge.h"

@implementation Challenge

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
            
            _question=([NSString stringWithFormat:@"%@ + %@ = ?", [NSString stringWithFormat:@"%i", _firstOperand], [NSString stringWithFormat:@"%i", _secondOperand]]);
            _answer = [NSString stringWithFormat:@"%i", (_firstOperand + _secondOperand)];
            
            break;
            
        case Subtraction:
            _question=([NSString stringWithFormat:@"%@ - %@ = ?", [NSString stringWithFormat:@"%i", _firstOperand], [NSString stringWithFormat:@"%i", _secondOperand]]);
            _answer = [NSString stringWithFormat:@"%i", (_firstOperand - _secondOperand)];
            break;
            
        case Multiplication:
            _question=([NSString stringWithFormat:@"%@ * %@ = ?", [NSString stringWithFormat:@"%i", _firstOperand], [NSString stringWithFormat:@"%i", _secondOperand]]);
            _answer = [NSString stringWithFormat:@"%i", (_firstOperand * _secondOperand)];
            break;
            
        
            
        default:
            break;
    }
    
    return _question;
    
}


- (NSString *) getChallengeWithDifficultyLevel: (ChallengeLevel) level withFunction: (FunctionType) functionType
{
    NSString *myString= [self getQuestionWithLevel:level withFunction:functionType];
    return myString;
    
}

- (NSMutableArray *) getASetOfAnswersWithDifficultyLevel: (ChallengeLevel) level withFunction: (FunctionType) functionType
 {
     
     int answerMax;
     
     
     switch (functionType) {
         case Addition:
             answerMax = level + level;
             break;
         case Subtraction:

              answerMax = level;
             break;
         case Multiplication:

              answerMax = level * level;
             break;
         
             
         default:
              answerMax = 0;
             break;
     }
     
     NSMutableArray *answers=[[NSMutableArray alloc] init];
    for (int i=0; i<4; i++) {
        [answers addObject:[NSString stringWithFormat:@"%i", [self getRandomNumberForLevel:answerMax]]];
    }
     [answers replaceObjectAtIndex:[self getRandomNumberForLevel:3] withObject:_answer];
     
     
    
     return answers;
}

@end
