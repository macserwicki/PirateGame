//
//  ViewController.m
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/9/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "ViewController.h"
#import "Character.h"
#import "Boss.h"
#import "Factory.h"
#import "Tile.h"
#import "TileExistanceLogic.h"
#import "BossFightLogic.h"

@interface ViewController () <BossFightLogicDelegate>

@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) Character *character;
@property (strong, nonatomic) Boss *boss;

@property (strong, nonatomic) TileExistanceLogic *tileExistance;
@property (strong, nonatomic) BossFightLogic *bossFightLogic;


//CGPoint holds X and Y Values
@property (nonatomic) CGPoint currentPoint;

@property (weak, nonatomic) IBOutlet UILabel *healthLbl;
@property (weak, nonatomic) IBOutlet UILabel *damageLbl;
@property (weak, nonatomic) IBOutlet UILabel *weaponLbl;
@property (weak, nonatomic) IBOutlet UILabel *armorLbl;
@property (weak, nonatomic) IBOutlet UILabel *storyLbl;
@property (weak, nonatomic) IBOutlet UIButton *actionBtnLbl;
@property (weak, nonatomic) IBOutlet UIImageView *itemImgView;
@property (weak, nonatomic) IBOutlet UIButton *northBtnLbl;
@property (weak, nonatomic) IBOutlet UIButton *eastBtnLbl;
@property (weak, nonatomic) IBOutlet UIButton *southBtnLbl;
@property (weak, nonatomic) IBOutlet UIButton *westBtnLbl;

@end



@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupGame];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void) viewWillAppear:(BOOL)animated {
}

//MARK: Update Tiles and Buttons

-(void) updateButtons {
    
    self.westBtnLbl.hidden = ![self.tileExistance tileExistsATPoint:CGPointMake(self.currentPoint.x-1, self.currentPoint.y) forTiles:self.tiles];

    self.eastBtnLbl.hidden = ![self.tileExistance tileExistsATPoint:CGPointMake(self.currentPoint.x+1, self.currentPoint.y) forTiles:self.tiles];
    self.northBtnLbl.hidden = ![self.tileExistance tileExistsATPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y+1) forTiles:self.tiles];
    self.southBtnLbl.hidden = ![self.tileExistance tileExistsATPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y-1) forTiles:self.tiles];
    
}

-(void) updateTile {
    
    self.actionBtnLbl.enabled = YES;
    
    CGFloat tileXValue = self.currentPoint.x;
    CGFloat tileYValue = self.currentPoint.y;
    Tile *tileModel = [[self.tiles objectAtIndex:tileXValue] objectAtIndex:tileYValue];
    self.storyLbl.text = tileModel.story;
    self.itemImgView.image = tileModel.itemImg;
    self.healthLbl.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLbl.text = [NSString stringWithFormat: @"%i", self.character.damage];
    self.weaponLbl.text = [NSString stringWithFormat: @"%@", self.character.weapon.name];
    self.armorLbl.text = [NSString stringWithFormat: @"%@", self.character.armor.name];
    [self.actionBtnLbl setTitle: tileModel.actionBtnName forState: UIControlStateNormal];
    
                           
}

//MARK: Game Setup

- (void) setupGame {
    
//Calls GET and SET.
    self.character = [Factory createCharacter];
    self.tiles =  [Factory createTiles];
    self.boss = [Factory createABoss];

    self.currentPoint = CGPointMake(0, 0);
    
    self.tileExistance = [[TileExistanceLogic alloc] init];
    self.bossFightLogic = [[BossFightLogic alloc] init];
    self.bossFightLogic.bossFightDelegate = self;
    
    //Starting Point
    [self.character calculateAttributesForArmor: self.character.armor withWeapon: self.character.weapon andHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    

}

-(void)playDidWin:(BOOL)playerWon {
    if (playerWon == YES) {


        
        [self showAlertWithTextForHeader:@"You Win!" withMessage: @"You defeated the evil chicken!"];
    } else {
        [self showAlertWithTextForHeader:@"Defeat" withMessage:@"You died. Reset the game."];
        self.westBtnLbl.enabled = NO;
        self.southBtnLbl.enabled = NO;
    }
}

-(void)showAlertWithTextForHeader: (NSString*) title withMessage: (NSString *) message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:true completion:nil];
}

//MARK: Buttons

- (IBAction)actionBtnPressed:(UIButton *)sender {
    
    //If at this tile, then we're fighting the boss.
    if (self.currentPoint.x == 3 && self.currentPoint.y == 2) {
        [self.bossFightLogic declareWinnerForCharacter:self.character andBoss:self.boss];
    }
    
    //Accessing Tile Data from Arrays
    Tile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    //Update Character Stats
    [self.character calculateAttributesForArmor:tile.armor withWeapon:tile.weapon andHealthEffect:tile.healthEffect];
    [self updateTile];
    self.actionBtnLbl.enabled = NO;
    
}

- (IBAction)northBtnPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastBtnPressed:(UIButton *)sender {
     self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southBtnPressed:(UIButton *)sender {
     self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
}


- (IBAction)westBtnPressed:(UIButton *)sender {
     self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetBtnPressed:(UIButton *)sender {
    self.character = nil;
    self.boss = nil;
    self.tiles = nil;
    self.westBtnLbl.enabled = YES;
    self.southBtnLbl.enabled = YES;
    [self setupGame];

}



@end
