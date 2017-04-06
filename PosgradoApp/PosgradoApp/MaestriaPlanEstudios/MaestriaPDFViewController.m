//
//  MaestriaPDFViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 04/04/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MaestriaPDFViewController.h"

@interface MaestriaPDFViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MaestriaPDFViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    self.webView.delegate=self;
    self.webView.scalesPageToFit=YES;
    [self.view addSubview:self.webView];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"demo" withExtension:@"pdf"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionDismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
