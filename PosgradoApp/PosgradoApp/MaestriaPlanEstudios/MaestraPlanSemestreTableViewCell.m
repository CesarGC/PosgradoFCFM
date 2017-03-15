//
//  MaestraPlanSemestreTableViewCell.m
//  PosgradoApp
//
//  Created by Servicio Social on 09/03/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MaestraPlanSemestreTableViewCell.h"

@interface MaestraPlanSemestreTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblSemestre;


@end

@implementation MaestraPlanSemestreTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)actualizaInfoSemestre:(NSDictionary *)dicc {
    if([dicc objectForKey:@"semestre"]) {
        self.lblSemestre.text = [dicc objectForKey:@"semestre"];
    } else if([dicc objectForKey:@"materia"]) {
        UIFont *font = self.lblSemestre.font;
        self.lblSemestre.font = [font fontWithSize:14];
        self.lblSemestre.text = [dicc objectForKey:@"materia"];
    }
}

@end
