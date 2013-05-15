//
//  HelloWorldLayer.m
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 12/05/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "Challenge.h"
#import "Bubble.h"
#import "BubbleGenerator.h"
#import "SimpleAudioEngine.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer



// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (void)StartGame
{
    // ask director for the window size
    
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    
    Challenge *gameChallenger = [[Challenge alloc] init];
    NSString *currentChallenge = [gameChallenger getChallengeWithDifficultyLevel:ChallengeLevelEasy withFunction:Addition];
    _finalAnswer = [gameChallenger answer];
    
    // create and initialize a Label
    CCLabelTTF *label = [CCLabelTTF labelWithString:currentChallenge fontName:@"Marker Felt" fontSize:64];
    
    
    
    
    //Position the label at the buttom of the screen.
    label.position =  ccp( size.width /2 , label.fontSize/2 );
    
    // add the label as a child to this Layer
    [self addChild: label];
    
    
    
    
    
    BubbleGenerator *bubbleGenerator=[[BubbleGenerator alloc] init];
    
    
    NSMutableArray *labels=[gameChallenger getASetOfAnswersWithDifficultyLevel:ChallengeLevelEasy withFunction:Addition];
    
    
    
    NSMutableArray *myArray=[bubbleGenerator generateBubbles:4 WithLabels:labels];
    
    for (Bubble *bubble in myArray)
    {
        [self addChild:[bubble bubbleSprite]];
    }
    
    for (Bubble *bubble in myArray)
    {
        [bubble liftBubble];
    }
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"win.wav"];
    [[SimpleAudioEngine sharedEngine] preloadEffect:@"lose.mp3"];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		//getting touches
        [[CCDirector sharedDirector] setDisplayFPS:NO];
        
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
        

        [self StartGame];

        
	}
	return self;
}




- (void)selectSpriteForTouch:(CGPoint)touchLocation {
    BOOL challengeHasEnded=NO;
    //int j=0;
    CCSprite * newSprite = nil;
    for (CCSprite *sprite in [self children]) {
        //j++;
        if (CGRectContainsPoint(sprite.boundingBox, touchLocation)) {
            challengeHasEnded=YES;
            newSprite = sprite;
            //[myObject isKindOfClass:[NSString class]]
            if (![newSprite isKindOfClass:[CCLabelTTF class]] ) {
                for (CCLabelTTF *anyLabel in [newSprite children]) {
                    if (anyLabel) {
                        NSString *selectedAnswer = [anyLabel string];
                        if (selectedAnswer==_finalAnswer) {
                            [[SimpleAudioEngine sharedEngine] playEffect:@"win.wav"];
                            
                        }else
                        {
                            [[SimpleAudioEngine sharedEngine] playEffect:@"lose.mp3"];

                        }
                        
                    }
                }
                
                
                [newSprite removeFromParentAndCleanup:YES];
                
                CCParticleSystemQuad* emmiter;
                emmiter = [CCParticleSystemQuad particleWithFile:@"BubbleBurst.plist"];
                [emmiter setTexture:[[CCTextureCache sharedTextureCache] addImage:@"BubbleBurstTexture.png"]];
                //[emmiter setDuration:1];
                [emmiter setPosition:touchLocation];
                [self addChild:emmiter];
                [emmiter resetSystem];
                break;
                
            }
            
        }
        
    }
    
    if (challengeHasEnded) {
        
        
        for (CCSprite *sprite in [self children]) {
            [sprite stopAllActions];
            //[sprite removeFromParentAndCleanup:YES];
            
            
        }

        
    }
    
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    [self selectSpriteForTouch:touchLocation];
    return TRUE;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
    // don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
