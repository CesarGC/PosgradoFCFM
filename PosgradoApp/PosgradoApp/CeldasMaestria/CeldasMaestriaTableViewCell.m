//
//  CeldasMaestriaTableViewCell.m
//  PosgradoApp
//
//  Created by Servicio Social on 17/01/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "CeldasMaestriaTableViewCell.h"

@interface CeldasMaestriaTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitulo;
@property (weak, nonatomic) IBOutlet UIView *vistaColor;
@property (weak, nonatomic) IBOutlet UIImageView *imagen;


@end

@implementation CeldasMaestriaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)actualizarCelda:(NSDictionary *)dicc {
    [self cambiaColor:[dicc objectForKey:@"id"]];
    self.lblTitulo.text = [dicc objectForKey:@"titulo"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)cambiaColor:(NSString *)color {
    if([color isEqualToString:@"verdeMatematica"]) {
        self.vistaColor.backgroundColor = [self colorFromHexString:@"2785FF"];
        self.imagen.image = [UIImage imageNamed:@"fisica"];
    } else if([color isEqualToString:@"azulFisica"]) {
        self.vistaColor.backgroundColor = [self colorFromHexString:@"2785FF"];
        self.imagen.image = [UIImage imageNamed:@"maestria_fisica"];
    } else if([color isEqualToString:@"celesteSeguridad"]) {
        self.vistaColor.backgroundColor = [self colorFromHexString:@"2785FF"];
        self.imagen.image = [UIImage imageNamed:@"fisica"];
    } else if([color isEqualToString:@"grisAstrofisica"]) {
        self.vistaColor.backgroundColor = [self colorFromHexString:@"2785FF"];
        self.imagen.image = [UIImage imageNamed:@"fisica"];
    }
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
