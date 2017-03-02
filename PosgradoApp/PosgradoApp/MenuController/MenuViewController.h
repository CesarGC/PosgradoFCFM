//
//  MenuViewController.h
//  PosgradoApp
//
//  Created by Servicio Social on 15/12/16.
//  Copyright © 2016 Servicio Social. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewControllerDelegate <NSObject>

-(void) cambiarViewController:(UIViewController *)controller;

@end

@interface MenuViewController : UIViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withIdentifier:(NSString *)identifier;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withArray:(NSArray *)arrayMenu;
- (void)cambiarArrayMenu:(NSArray *)array withIdentifier:(NSString *)identifier;

@property (strong, nonatomic) id <MenuViewControllerDelegate> delegado;
@property (nonatomic, strong) NSString *identifier;

@end
