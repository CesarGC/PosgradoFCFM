//
//  MaestriaPlanCompletoTableViewCell.m
//  PosgradoApp
//
//  Created by Servicio Social on 07/03/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MaestriaPlanCompletoTableViewCell.h"

@interface MaestriaPlanCompletoTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lblMateria;
@property (weak, nonatomic) IBOutlet UILabel *lblHora;
@property (weak, nonatomic) IBOutlet UILabel *lblCreditos;

@end

@implementation MaestriaPlanCompletoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
