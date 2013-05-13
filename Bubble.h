//
//  Bubble.h
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 13/05/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Bubble : CCSprite


@property (nonatomic, retain) CCSprite *bubbleSprite;



- (id)initWithBubble;
-(CCSprite *) makeBubble;
- (void) liftBubble;



@end
