//
//  MaestriaProfesoresTableViewCell.m
//  PosgradoApp
//
//  Created by Servicio Social on 14/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MaestriaProfesoresTableViewCell.h"

@interface MaestriaProfesoresTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblProfesor;

@end

@implementation MaestriaProfesoresTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)actualizarDatos:(NSDictionary *)dicc {
    self.lblProfesor.text = [dicc objectForKey:@"profesor"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
