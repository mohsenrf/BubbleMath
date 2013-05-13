//
//  Challenge.h
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 12/05/13.
//
//

#import <Foundation/Foundation.h>

typedef  enum {ChallengeLevelHard=1000, ChallengeLevelMedium=100,ChallengeLevelEasy=10} ChallengeLevel;

typedef enum {Addition, Multiplication, Division, Subtraction} FunctionType;


@interface Challenge : NSObject


@property (strong, nonatomic) NSString *question, *answer;
@property int firstOperand, secondOperand;


-(int) getRandomNumberForLevel:(ChallengeLevel) level;

-(NSString *) getQuestionWithLevel:(ChallengeLevel) level withFunction:(FunctionType) functionType;

-(NSString *) getChallenge: (ChallengeLevel) level withFunction: (FunctionType) functionType;



@end
