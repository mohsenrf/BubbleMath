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
    
    for (int i=0; i<numberOfBubbles; i++) {
        Bubble *bubble=[[Bubble alloc] initWithBubbleWithPosition:CGPointMake(100, 100) WithText:[bubbleLabels objectAtIndex:i]];
        [bubbles addObject:bubble];
    }
    
    return bubbles;
    
}




@end
