//
//  HelloWorldLayer.h
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 12/05/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}
@property (strong, nonatomic) NSString *finalAnswer;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
