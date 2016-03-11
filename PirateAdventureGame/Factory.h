//
//  Factory.h
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/11/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boss.h"
#import "Character.h"

@interface Factory : NSObject

+(Boss *)createABoss;

+(Character *)createCharacter;

@end
