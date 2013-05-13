//
//  ParticleGenerator.h
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 14/05/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface ParticleGenerator : NSObject


-(void) bubbleBurstParticle:(CGPoint)touchLocation;


-(CCParticleSystemQuad*) normalParticleDestory:(CGPoint) location WithDuration: (double) duration;


@end
