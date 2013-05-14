//
//  BubbleGenerator.m
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 13/05/13.
//
//

#import "BubbleGenerator.h"

@implementation BubbleGenerator


-(NSMutableArray *) generateBubbles: (int) numberOfBubbles WithLabels: (NSMutableArray *) bubbleLabels
{
    NSMutableArray *bubbles=[[NSMutableArray alloc]init];
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    float borderLine=size.height / (numberOfBubbles+1);
    
    for (int i=0; i<numberOfBubbles; i++) {
        Bubble *bubble=[[Bubble alloc] initWithBubbleWithPosition:CGPointMake((borderLine * (i+1)),-50) WithText:[bubbleLabels objectAtIndex:i]];
        [bubbles addObject:bubble];
    }
    
    
    
    return bubbles;
    
}




@end
