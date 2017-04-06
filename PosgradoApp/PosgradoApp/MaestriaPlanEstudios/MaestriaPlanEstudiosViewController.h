//
//  MaestriaPlanEstudiosViewController.h
//  PosgradoApp
//
//  Created by Servicio Social on 07/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PDFControllerDelegate <NSObject>

-(void) presentarPDFController:(UIViewController *)controller;

@end

@interface MaestriaPlanEstudiosViewController : UIViewController

@property (strong, nonatomic) id <PDFControllerDelegate> delegado;

@end
