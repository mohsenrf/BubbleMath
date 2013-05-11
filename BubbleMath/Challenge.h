//
//  Challenge.h
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 12/05/13.
//
//

#import <Foundation/Foundation.h>

typedef  enum {Hard=1000, Medium=100,Easy=10} Level;
typedef enum {Addition, Multiplication, Division, Subtraction} FunctionType;
#define EASY 10
#define MEDIUM 100
#define HARD 1000

#define ADDITION 1
#define SUBTRACT 2
#define MULTIPLICATION 3
#define DIVISION 4

@interface Challenge : NSObject


@property (strong, nonatomic) NSString *question, *answer;
@property int firstOperand, secondOperand;


-(int) getRandomNumberForLevel:(int) level;

-(NSString *) getQuestionWithLevel:(int) level withFunction:(int) functionType;

-(NSString *) getChallenge: (int) level withFunction: (int) functionType;



@end
