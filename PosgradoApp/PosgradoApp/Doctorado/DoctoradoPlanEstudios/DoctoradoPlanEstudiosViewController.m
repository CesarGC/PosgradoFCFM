//
//  MaestriaPlanEstudiosViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 07/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "DoctoradoPlanEstudiosViewController.h"

@interface DoctoradoPlanEstudiosViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation DoctoradoPlanEstudiosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"plan_estudio_doctorado" withExtension:@"html"];
    NSError *error;
    NSString *contentString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    NSURL *baseUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.webView loadHTMLString:contentString baseURL:baseUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
