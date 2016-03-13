//
//  TileExistanceLogic.h
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/13/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TileExistanceLogic : NSObject

-(BOOL)tileExistsATPoint:(CGPoint) point forTiles: (NSArray *)tileArray;

@end
