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
    tile2.actionBtnName = @"Take the Armor!";
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
    dogWeapon.damage = 10;
    tile4.armor = dogArmor;
    tile4.weapon = dogWeapon;
    tile4.actionBtnName = @"Adobt The Dog";
    tile4.healthEffect = 0;
    
    Tile *tile5 = [[Tile alloc] init];
    tile5.story = @"You've found a chest, opening it reveald a beautiful double-headed axe. Should we take it?";
    tile5.itemImg = [UIImage imageNamed:@"axe"];
    Weapon *axeWeapon = [[Weapon alloc] init];
    axeWeapon.name = @"Axe";
    axeWeapon.damage = 17;
    tile5.healthEffect = 0;
    tile5.weapon = axeWeapon;
    tile5.actionBtnName = @"Take The Axe";
    
    Tile *tile6 = [[Tile alloc] init];
    tile6.story = @"Oh no! It's a trap, and you've been captured. We have to fight for our life!";
    tile6.itemImg = [UIImage imageNamed:@"bandit"];
    tile6.healthEffect = -22;
    tile6.actionBtnName = @"Fight For Your Life";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];

    Tile *tile7 = [[Tile alloc] init];
    tile7.story = @"What is that on the horizon? Is that... Is that a walking shark with a laser? Should we attack it?";
    tile7.itemImg = [UIImage imageNamed:@"shark"];
    tile7.healthEffect = 8;
    tile7.actionBtnName = @"Turn it into sushi, and eat it.";
    
    Tile *tile8 = [[Tile alloc] init];
    tile8.story = @"The Wyvern has spotted us and is headed directly toward us. Run and hide!";
    tile8.itemImg = [UIImage imageNamed:@"wyvern"];
    tile8.healthEffect = -48;
    tile8.actionBtnName = @"Run and Hide";
    
    
    Tile *tile9 = [[Tile alloc] init];
    tile9.story = @"When hiding from the Wyvern you found another treasure chest. You open it to see if it has anything useful and find a good tasting potion";
    tile9.itemImg = [UIImage imageNamed:@"treasure"];
    tile9.healthEffect = 20;
    tile9.actionBtnName = @"Loot The Treasure Chest";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];

    Tile *tile10 = [[Tile alloc] init];
    tile10.story = @"Bandits surround you and demand you give them all your findings. Your instincts tell you that these bandtis will kill you anyways once you hand them your weapons, so you decide to stay and fight them because they blocked your path.";
    tile10.itemImg = [UIImage imageNamed:@"bandit"];
    tile10.healthEffect = -15;
    tile10.actionBtnName = @"Show Them Who's Alpha";
    
    Tile *tile11 = [[Tile alloc] init];
    tile11.story = @"You follow the river to a peaceful lake. Looks benign, but you never know what might be behind the thick tree line.";
    tile11.itemImg = [UIImage imageNamed:@"lake"];
    tile11.healthEffect = -7;
    tile11.actionBtnName = @"Swim Lake";
    
    Tile *tile12 = [[Tile alloc] init];
    tile12.story = @"This is it. Your hard work and exploring prepared you to face off the  mutated Mega Turkey-Chicken Boss. It seems a lot less smaller and less scary than how the legends describe it.";
    tile12.itemImg = [UIImage imageNamed:@"chicken"];
    tile12.healthEffect = -10;
    tile12.actionBtnName = @"Fight Boss!";
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject: tile10];
    [fourthColumn addObject: tile11];
    [fourthColumn addObject: tile12];

    
    //NSMutableArrays (3 tiles) inside 'tiles' array.
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColomn, secondColumn, thirdColumn, fourthColumn, nil];
    
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
    weapon.damage = 0;
    character.weapon = weapon;
    character.damage = 0;
    
    return character;
    
}


@end
