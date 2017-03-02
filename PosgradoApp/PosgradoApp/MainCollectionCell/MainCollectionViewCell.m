//
//  MainCollectionViewCell.m
//  PosgradoApp
//
//  Created by Servicio Social on 13/12/16.
//  Copyright © 2016 Servicio Social. All rights reserved.
//

#import "MainCollectionViewCell.h"

@interface MainCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageMenu;
@property (weak, nonatomic) IBOutlet UILabel *nameMenu;

@property (strong, nonatomic, readwrite) NSDictionary *diccMenu;

@end

@implementation MainCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)actualizarDatos:(NSDictionary *)dicc {
    self.diccMenu = dicc;
    [self.imageMenu setImage:[UIImage imageNamed:[dicc objectForKey:@"image"]]];
    [self.nameMenu setText:[dicc objectForKey:@"name"]];
}

@end
