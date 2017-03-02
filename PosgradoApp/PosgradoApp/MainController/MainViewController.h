//
//  MainViewController.h
//  PosgradoApp
//
//  Created by Servicio Social on 13/12/16.
//  Copyright © 2016 Servicio Social. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuSeleccionDelegate <NSObject>

- (void) cambiarViewController:(UIViewController *)controller withArray:(NSArray *)arrayMenu;

@end

@interface MainViewController : UIViewController

@property (strong, nonatomic) id <MenuSeleccionDelegate> delegado;

@end
