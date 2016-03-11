//
//  Factory.m
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/11/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "Factory.h"

@implementation Factory

+(Boss *)createABoss {
    
    Boss *boss = [[Boss alloc] init];
    
    boss.health = 100;
    boss.damage = 15;
    
    return  boss;
    
}

+(Character *)createCharacter {
    
    Character *character = [[Character alloc] init];
    
    character.health = 100;
    character.damage = 30;
    
    Armor *armor = [[Armor alloc] init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"Fists";
    character.damage = 0;
    
    return character;
    
}


@end
