//
//  BubbleGenerator.h
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 13/05/13.
//
//

#import <Foundation/Foundation.h>
#import "Bubble.h"

@interface BubbleGenerator : NSObject

@property (nonatomic, retain) CCSprite *bubbleSprite;
-(NSMutableArray *) generateBubbles: (int) numberOfBubbles WithLabels: (NSMutableArray *) bubbleLabels;

@end
