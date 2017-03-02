//
//  MenuTableViewCell.m
//  PosgradoApp
//
//  Created by Servicio Social on 15/12/16.
//  Copyright © 2016 Servicio Social. All rights reserved.
//

#import "MenuTableViewCell.h"

@interface MenuTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitulo;


@end

@implementation MenuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)actualizarDatos:(NSDictionary *)dicc {
    self.lblTitulo.text = [dicc objectForKey:@"titulo"];
}

@end
