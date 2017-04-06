//
//  MaestriaPlanCompletoTableViewCell.m
//  PosgradoApp
//
//  Created by Servicio Social on 07/03/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "DoctoradoPlanCompletoTableViewCell.h"

@interface DoctoradoPlanCompletoTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lblMateria;
@property (weak, nonatomic) IBOutlet UILabel *lblHora;
@property (weak, nonatomic) IBOutlet UILabel *lblCreditos;

@end

@implementation DoctoradoPlanCompletoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)actualizaInformacion:(NSDictionary *)dicc {
    self.lblHora.text = [dicc objectForKey:@"horas"];
    self.lblMateria.text = [dicc objectForKey:@"materia"];
    self.lblCreditos.text = [dicc objectForKey:@"credito"];
}

@end
