//
//  ContactoViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 23/03/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "ContactoViewController.h"

@interface ContactoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageHeader;


@end

@implementation ContactoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.imageHeader.layer.cornerRadius = 10.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
