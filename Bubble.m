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
        [_bubbleSprite setPosition:ccp( 150 , -30 )];
        
        
        //Make a CCLabelTFF
        CCLabelTTF *possibleAnswer = [CCLabelTTF labelWithString:@"Hey!" fontName:@"Arial" fontSize:42];
        
        //Centre text on the bubble
        CGSize bubbleSpriteSize = _bubbleSprite.contentSize;
        [possibleAnswer setPosition:ccp(bubbleSpriteSize.width / 2, bubbleSpriteSize.height / 2)];
        
        //add it to the sprite
        [_bubbleSprite addChild: possibleAnswer];
    }
    return self;
}

- (void) liftBubble
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    
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


@end
