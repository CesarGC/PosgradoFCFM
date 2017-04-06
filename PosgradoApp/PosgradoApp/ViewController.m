//
//  ViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 13/12/16.
//  Copyright © 2016 Servicio Social. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "JASidePanelController.h"
#import "MenuViewController.h"
#import "CustonNavigationViewController.h"
#import "TablaMaestriaViewController.h"
#import "FisicaIndustrialViewController.h"
#import "DoctoradoFisicaIndustrialViewController.h"
#import "MaestriaPlanEstudiosViewController.h"

@interface ViewController () <MenuSeleccionDelegate, MenuViewControllerDelegate, PDFControllerDelegate>

@property (weak, nonatomic) IBOutlet UIView *barraPrincipal;
@property (weak, nonatomic) IBOutlet UIView *vistaPrincipal;
@property (strong, nonatomic) MainViewController *mainController;
@property (strong, nonatomic) MenuViewController *menuController;
@property (strong, nonatomic) JASidePanelController *controllerPanel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintWidthBack;
@property (strong, nonatomic) CustonNavigationViewController *navigationCustom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintWidth;
@property (weak, nonatomic) IBOutlet UILabel *lblTituloPrincipal;
@property (weak, nonatomic) IBOutlet UIButton *btnMenu;
@property (assign, nonatomic) BOOL isShowMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.constraintWidth.constant = 0;
    self.btnMenu.hidden = YES;
    self.controllerPanel = [[JASidePanelController alloc] init];
    self.controllerPanel.allowLeftSwipe = NO;
    self.menuController = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    self.menuController.delegado = self;
    self.controllerPanel.view.frame = self.vistaPrincipal.bounds;
    self.controllerPanel.leftPanel.view.frame = self.vistaPrincipal.bounds;
    self.mainController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.mainController.view.frame = self.vistaPrincipal.bounds;
    self.mainController.delegado = self;
    self.navigationCustom = [[CustonNavigationViewController alloc] initWithRootViewController:self.mainController];
    self.navigationCustom.navigationBar.hidden = YES;
    self.controllerPanel.centerPanel = self.navigationCustom;
    self.controllerPanel.leftPanel = self.menuController;
    [self.vistaPrincipal addSubview:self.controllerPanel.view];
    if ([self.navigationCustom respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationCustom.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)abrirMenu:(id)sender {
    [self.controllerPanel toggleLeftPanel:nil];
}

- (IBAction)regresarController:(id)sender {
    NSLog(@"View controllers %lu", (unsigned long)self.navigationCustom.viewControllers.count);
    if(self.navigationCustom.viewControllers.count > 2) {
        [self.navigationCustom popViewControllerAnimated:YES];
        
    } else {
        self.constraintWidth.constant = 0;
        self.btnMenu.hidden = YES;
        [self.navigationCustom popViewControllerAnimated:YES];
    }
    NSLog(@"View controllers %lu", (unsigned long)self.navigationCustom.viewControllers.count);
}


- (void)cambiarViewController:(UIViewController *)controller withArray:(NSArray *)arrayMenu {
    self.constraintWidth.constant = 30;
    self.constraintWidthBack.constant = 0;
    if(arrayMenu.count > 0) {
        [self.menuController cambiarArrayMenu:nil withIdentifier:@"maestria"];
    }
    if([controller isKindOfClass:[TablaMaestriaViewController class]]) {
        [(TablaMaestriaViewController *)controller setDelegado:self];
    }

    if([controller isKindOfClass:[FisicaIndustrialViewController class]]) {
        self.menuController.identifier = @"maestria";
        [self.menuController cambiarArrayMenu:nil withIdentifier:@"maestria"];
        self.constraintWidthBack.constant = 30;
        self.btnMenu.hidden = NO;
        self.controllerPanel.allowLeftSwipe = YES;
    } else if([controller isKindOfClass:[DoctoradoFisicaIndustrialViewController class]]) {
        self.menuController.identifier = @"doctorado";
        [self.menuController cambiarArrayMenu:nil withIdentifier:@"doctorado"];
        self.constraintWidthBack.constant = 30;
        self.btnMenu.hidden = NO;
        self.controllerPanel.allowLeftSwipe = YES;
    }
    [self.navigationCustom pushViewController:controller animated:YES];
}

- (void)presentarControllerPDF:(UIViewController *)controller {
    [self presentarControllerPDF:controller];
}

- (void)cambiarViewController:(UIViewController *)controller {
    [self.controllerPanel toggleLeftPanel:nil];
    if([controller isKindOfClass:[MaestriaPlanEstudiosViewController class]]) {
        ((MaestriaPlanEstudiosViewController *)controller).delegado = self;
    }
    [self.navigationCustom pushViewController:controller animated:YES];
}

- (IBAction)actionBtnPrincipal:(id)sender {
//    UIViewController *controller = [self.navigationCustom.viewControllers objectAtIndex:0];
    [self.navigationCustom popToRootViewControllerAnimated:YES];
    self.controllerPanel.allowLeftSwipe = NO;
}

- (IBAction)actionShare:(id)sender {
    NSString *textToShare = @"Revisa la información acerca de la maestria y doctorado de Fisica Industrial con este enlace";
    NSURL *myWebsite = [NSURL URLWithString:@"http://www.fcfm.uanl.mx/es/Posgrado"];
    
    NSArray *objectsToShare = @[textToShare, myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (void)presentarPDFController:(UIViewController *)controller {
    [self presentViewController:controller animated:YES completion:nil];
}

@end
