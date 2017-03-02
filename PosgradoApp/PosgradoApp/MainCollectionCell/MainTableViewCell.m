//
//  MainTableViewCell.m
//  PosgradoApp
//
//  Created by Servicio Social on 12/01/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *lblTitulo;
@property (weak, nonatomic) IBOutlet UIImageView *imageMenu;


@end

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)actualizarCelda:(NSDictionary *)datos {
    self.lblTitulo.text = [datos objectForKey:@"name"];
    self.imageMenu.image = [UIImage imageNamed:[datos objectForKey:@"image"]];
}


@end
