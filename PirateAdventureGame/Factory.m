//
//  Factory.m
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/11/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "Factory.h"
#import "Tile.h"

@implementation Factory


+(NSArray *)createTiles {
    
    Tile *tile1 = [[Tile alloc] init];
    
    //Custom Initializer?
    tile1.story = @"As the mightiest heorine in these parts of our land, we need you to underatke a perlious journey to defeat the Mega Boss threat. How exciting - here is a rusty sword to get you started!";
    tile1.itemImg = [UIImage imageNamed:@"sword"];
    Weapon *bluntedSword = [[Weapon alloc] init];
    bluntedSword.name = @"Old Rusty Sword";
    bluntedSword.damage = 12;
    tile1.actionBtnName = @"Take the Sword!";
    tile1.healthEffect = 0;
    tile1.weapon = bluntedSword;
    
    Tile *tile2 = [[Tile alloc] init];
    tile2.story = @"You have come across an armorer. You're old and ripped cloak won't be much use on your journey. How about a nice set of steel armor the blacksmith's apprentice made? It's free because you've showed your courage by underatking the quest to defeat the evil boss.";
    tile2.itemImg = [UIImage imageNamed:@"armor"];
    Armor *armor2 = [[Armor alloc] init];
    armor2.name = @"Steel Armor";
    armor2.health = 8;
    tile2.armor = armor2;
    tile2. healthEffect = 0;
    
    Tile *tile3 = [[Tile alloc] init];
    tile3.story = @"There is a mysteious looking person in the distance. He looks shifty and odd. We're lost so we better ask for directions anyway. It's better than wandering lost in this area...";
    tile3.itemImg = [UIImage imageNamed:@"druid"];
    tile3.healthEffect = 12;
    tile3.actionBtnName = @"Approach The Man";
    
    NSMutableArray *firstColomn = [[NSMutableArray alloc] init];
    
    [firstColomn addObject: tile1];
    [firstColomn addObject: tile2];
    [firstColomn addObject: tile3];
    
    Tile *tile4 = [[Tile alloc] init];
    tile4.story = @"Hey! You found a dog. He really wants to follow you. Hmm... These types of dogs are great in battle and might help me stay warm at night. Would be great to take him with me.";
    tile4.itemImg = [UIImage imageNamed:@"dog"];
    Armor *dogArmor = [[Armor alloc] init];
    dogArmor.health = 20;
    dogArmor.name = @"Dog";
    Weapon *dogWeapon = [[Weapon alloc] init];
    dogWeapon.name = @"Dog Claw";
    
    
    //NSMutableArrays (3 tiles) inside 'tiles' array.
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColomn, nil];
    
    return tiles;
}


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
