//
//  Character.h
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/11/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "Creature.h"
#import "Armor.h"
#import "Weapon.h"

@interface Character : Creature

@property (strong, nonatomic) Armor *armor;
@property (strong, nonatomic) Weapon *weapon;

-(void) calculateAttributesForArmor: (Armor *)armorName withWeapon:(Weapon *)weaponName andHealthEffect:(int)healthEffect;

@end
