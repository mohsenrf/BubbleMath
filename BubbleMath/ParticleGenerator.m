//
//  ParticleGenerator.m
//  BubbleMath
//
//  Created by Mohsen Rahimifar on 14/05/13.
//
//

#import "ParticleGenerator.h"
@implementation ParticleGenerator


-(void) bubbleBurstParticle:(CGPoint)touchLocation {
    
}


-(CCParticleSystemQuad*) normalParticleDestory:(CGPoint) location WithDuration: (double) duration;

{
    CCParticleSystemQuad *emmiter;
    
    
    emmiter = [CCParticleSystemQuad particleWithFile:@"poof.plist"];
    emmiter.texture=[[CCTextureCache sharedTextureCache] addImage:@"poof.png"];
    [emmiter setDuration:0.01f];
    emmiter.position=location;
    
    
    
    return emmiter;
}
@end
