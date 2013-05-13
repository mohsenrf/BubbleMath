//
//  Bubble.m
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 13/05/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Bubble.h"


@implementation Bubble

//@synthesize bubbleSprite;


- (id)initWithBubble {
    self = [super init];
    if (self) {
        
        _bubbleSprite=[CCSprite spriteWithFile:@"bubble.png"];
        [_bubbleSprite setScaleX:0.2f];
        [_bubbleSprite setScaleY:0.2f];

        
        
    }
    return self;
}



-(CCSprite *) makeBubble
{

    //CGSize size = [[CCDirector sharedDirector] winSize];
    _bubbleSprite=[CCSprite spriteWithFile:@"bubble.png"];
    
    //[bubble setTextureRect:CGRectMake(10,10,100,100)];
    //[bubble setContentSize:CGSizeMake(5.0f, 5.0f)];
    [_bubbleSprite setScaleX:0.2f];
    [_bubbleSprite setScaleY:0.2f];
    //bubble.position = ccp( size.width /2 , size.height/2 );
    
    return _bubbleSprite;
}


@end
