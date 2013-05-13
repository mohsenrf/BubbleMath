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
        
        CGPoint defaultPoint=CGPointMake(150,130);
        _bubbleSprite=[CCSprite spriteWithFile:@"bubble.png"];
        [_bubbleSprite setScaleX:0.2f];
        [_bubbleSprite setScaleY:0.2f];
        [_bubbleSprite setPosition:ccp( defaultPoint.x , defaultPoint.y )];
        
        
        //Make a CCLabelTFF
        CCLabelTTF *possibleAnswer = [CCLabelTTF labelWithString:@"Hey!" fontName:@"Arial" fontSize:42];
        
        //Centre text on the bubble
        CGSize bubbleSpriteSize = _bubbleSprite.contentSize;
        [possibleAnswer setPosition:ccp(bubbleSpriteSize.width / 2, bubbleSpriteSize.height / 2)];
        
        //wobble the bubble
        [self wobble];
        //add it to the sprite
        [_bubbleSprite addChild: possibleAnswer];
    }
    return self;
}

- (void) liftBubble
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    [_bubbleSprite setPosition:ccp( 150 , -30 )];
    
    CCAction *moveBubble=[CCMoveTo actionWithDuration:5
                                             position:CGPointMake(_bubbleSprite.position.x , size.height+45)];
    
    [_bubbleSprite runAction:moveBubble];
    
}
-(CCSprite *) makeBubble
{
    
    _bubbleSprite=[CCSprite spriteWithFile:@"bubble.png"];
    
    //[bubble setTextureRect:CGRectMake(10,10,100,100)];
    //[bubble setContentSize:CGSizeMake(5.0f, 5.0f)];
    
    [_bubbleSprite setScaleX:0.2f];
    [_bubbleSprite setScaleY:0.2f];
    
    //CGSize size = [[CCDirector sharedDirector] winSize];
    [_bubbleSprite setPosition:ccp( 10 , -30 )];
    
    return _bubbleSprite;
}

- (void) wobble
{
    
    //Defining action to animate property change.
    id action = [CCActionTween actionWithDuration:0.13 key:@"scaleX" from:0.2 to:0.19];
    id action2 = [CCActionTween actionWithDuration:0.11 key:@"scaleY" from:0.2 to:0.18
                  ];
    
    //first sequence loop changes width of the bubble.
    CCSequence *pulseSequence = [CCSequence actions:action,[action reverse], nil];
    CCRepeatForever *repeat = [CCRepeatForever actionWithAction:pulseSequence];
    [_bubbleSprite runAction:repeat];
    
    
    //second sequence loop changes height of the bubble.
    CCSequence *pulseSequence2 = [CCSequence actions:action2,[action2 reverse], nil];
    CCRepeatForever *repeat2 = [CCRepeatForever actionWithAction:pulseSequence2];
    [_bubbleSprite runAction:repeat2];
    
}


@end
