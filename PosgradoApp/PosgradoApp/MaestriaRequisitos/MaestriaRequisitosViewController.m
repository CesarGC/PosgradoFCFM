//
//  MaestriaRequisitosViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 07/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MaestriaRequisitosViewController.h"

@interface MaestriaRequisitosViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblRequisitos;
@property (weak, nonatomic) IBOutlet UILabel *lblPermancia;
@property (weak, nonatomic) IBOutlet UILabel *lblEgresado;
@property (weak, nonatomic) IBOutlet UILabel *lblRequisitosAdmision;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MaestriaRequisitosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGRect admision = self.lblRequisitosAdmision.frame;
    CGRect permanencia = self.lblPermancia.frame;
    CGRect egresado = self.lblEgresado.frame;
    
    if(scrollView.contentOffset.y <= 0 ) {
        self.lblRequisitos.text = @"Requisitos";
    } else if(scrollView.contentOffset.y > admision.origin.y && scrollView.contentOffset.y <= permanencia.origin.y) {
        self.lblRequisitos.text = @"Requisitos de admisión";
    } else if(scrollView.contentOffset.y > permanencia.origin.y && scrollView.contentOffset.y <= egresado.origin.y) {
        self.lblRequisitos.text = @"Requisitos de Permanencia";
    } else if(scrollView.contentOffset.y > egresado.origin.y) {
        self.lblRequisitos.text = @"Requisitos de Egreso";
    }
    
}

@end
