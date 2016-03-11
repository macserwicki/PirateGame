//
//  ViewController.m
//  PirateAdventureGame
//
//  Created by Maciej Serwicki on 3/9/16.
//  Copyright © 2016 Maciej Serwicki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *healthLbl;

@property (weak, nonatomic) IBOutlet UILabel *damageLbl;

@property (weak, nonatomic) IBOutlet UILabel *weaponLbl;

@property (weak, nonatomic) IBOutlet UILabel *armorLbl;

@property (weak, nonatomic) IBOutlet UILabel *storyLbl;

@property (weak, nonatomic) IBOutlet UIButton *ActionBtnLbl;

@property (weak, nonatomic) IBOutlet UIImageView *itemImgView;

@property (weak, nonatomic) IBOutlet UIButton *northBtnLbl;

@property (weak, nonatomic) IBOutlet UIButton *eastBtnLbl;

@property (weak, nonatomic) IBOutlet UIButton *southBtnLbl;

@property (weak, nonatomic) IBOutlet UIButton *westBtnLbl;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
