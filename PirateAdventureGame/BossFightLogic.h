//
//  BossFightLogic.h
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/13/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boss.h"
#import "Character.h"

@protocol BossFightLogicDelegate <NSObject>

@required

-(void)playDidWin: (BOOL)playerWon;

@end

@interface BossFightLogic : NSObject

-(void)declareWinnerForCharacter:(Character *)character andBoss:(Boss *) Boss;

@property (nonatomic, weak) id <BossFightLogicDelegate> bossFightDelegate;

@end
