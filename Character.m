//
//  Character.m
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/11/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "Character.h"

@implementation Character

-(void) calculateAttributesForArmor: (Armor *)armorName withWeapon:(Weapon *)weaponName andHealthEffect:(int)healthEffect {
    
    if (armorName != nil) {
        //Removes old armor, and puts on new armor. Change health values.
        self.health = self.health - self.armor.health + armorName.health;
        self.armor = armorName;
    }
    
    if (weaponName != nil) {
        self.damage = self.damage - self.weapon.damage + weaponName.damage;
        self.weapon = weaponName;
    }
    
    if (healthEffect != 0 && healthEffect != nil)  {
        self.health = self.health + healthEffect;
    }

}

@end
