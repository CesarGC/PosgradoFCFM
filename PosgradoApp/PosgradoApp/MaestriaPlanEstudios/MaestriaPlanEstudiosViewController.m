//
//  MaestriaPlanEstudiosViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 07/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MaestriaPlanEstudiosViewController.h"

@interface MaestriaPlanEstudiosViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITableView *tablaPlanEstudioTiempoCompleto;
@property (weak, nonatomic) IBOutlet UITableView *tablaPlanEstudioTiempoParcial;
@property (weak, nonatomic) IBOutlet UITableView *tablaOptativas;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightCompleto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightParcial;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightOptativas;

@end

@implementation MaestriaPlanEstudiosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"plan_estudio" withExtension:@"html"];
    NSError *error;
    NSString *contentString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    NSURL *baseUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.webView loadHTMLString:contentString baseURL:baseUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
