//
//  TileExistanceLogic.m
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/13/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "TileExistanceLogic.h"

@implementation TileExistanceLogic

-(BOOL)tileExistsATPoint:(CGPoint) point forTiles: (NSArray *)tileArray {
    
    if (point.y >= 0 && point.x >= 0 && point.x < [tileArray count] && point.y < [[tileArray objectAtIndex:point.x] count]) {
        return YES;
    }
    return NO;
}

@end
