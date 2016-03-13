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

@interface ViewController ()

@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) Character *character;
@property (strong, nonatomic) Boss *boss;

@property (strong, nonatomic) TileExistanceLogic *tileExistance;

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
    // Do any additional setup after loading the view, typically from a nib.
}


- (void) viewWillAppear:(BOOL)animated {
    [self setupGame];
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
    self.tiles =  [Factory createTiles];
    self.character = [Factory createCharacter];
    self.boss = [Factory createABoss];

    self.currentPoint = CGPointMake(0, 0);
    
    self.tileExistance = [[TileExistanceLogic alloc] init];
    
    //Starting Point
    [self.character calculateAttributesForArmor:nil withWeapon:nil andHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    
//Accesses instance var directly. Avoids GET and SET.
//    _tiles =  [Factory createTiles];
//    _character = [Factory createCharacter];
//    _boss = [Factory createABoss];
//    _currentPoint = CGPointMake(0, 0);

}



//MARK: Buttons

- (IBAction)actionBtnPressed:(UIButton *)sender {
}

- (IBAction)northBtnPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
}

- (IBAction)eastBtnPressed:(UIButton *)sender {
     self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
}

- (IBAction)southBtnPressed:(UIButton *)sender {
     self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
}


- (IBAction)westBtnPressed:(UIButton *)sender {
     self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
}

- (IBAction)resetBtnPressed:(UIButton *)sender {
    [self setupGame];
}



@end
