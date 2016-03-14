//
//  BossFightLogic.m
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/13/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "BossFightLogic.h"

@implementation BossFightLogic

-(void)declareWinnerForCharacter:(Character *)character andBoss:(Boss *) boss {
    while (boss.health > 0) {
        int bonusDamage = arc4random_uniform(5);
        boss.health = boss.health - character.damage;
        character.health = character.health - (boss.damage + bonusDamage);
        
        if (character.health <= boss.health) {
            //Check character health. If character dies & boss dies, then gameover
            //game over;
            [self.bossFightDelegate playDidWin:NO];
            break;
        } else if (boss.health <= 0) {
            //victory;
            [self.bossFightDelegate playDidWin:YES];
            break;
        }
        
    }
}

@end
