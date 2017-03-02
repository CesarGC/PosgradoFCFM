//
//  TablaMaestriaViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 17/01/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "TablaMaestriaViewController.h"
#import "CeldasMaestriaTableViewCell.h"
#import  "FisicaIndustrialViewController.h"

@interface TablaMaestriaViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tablaMaestria;
@property (strong, nonatomic) NSArray *arrayMaestria;

@end

@implementation TablaMaestriaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tablaMaestria registerNib:[UINib nibWithNibName:@"CeldasMaestriaTableViewCell" bundle:nil] forCellReuseIdentifier:@"celdaMaster"];
    self.tablaMaestria.delegate = self;
    self.tablaMaestria.dataSource = self;
    self.arrayMaestria = @[@{@"titulo":@"Ciencias con Orientación en Matemáticas", @"id":@"verdeMatematica"}, @{@"titulo":@"Ing. Física Industrial", @"id":@"azulFisica"}, @{@"titulo":@"Ing. en Seguridad de la Información", @"id":@"celesteSeguridad"}, @{@"titulo":@"Maestría en Astrofísica Planetaria y Tecnologías Afines", @"id":@"grisAstrofisica"}];
    self.tablaMaestria.estimatedRowHeight = 50;
    self.tablaMaestria.rowHeight = UITableViewAutomaticDimension;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayMaestria.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CeldasMaestriaTableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:@"celdaMaster" forIndexPath:indexPath];
    [celda actualizarCelda:[self.arrayMaestria objectAtIndex:indexPath.row]];
    return celda;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identificador = [(NSDictionary *)[self.arrayMaestria objectAtIndex:indexPath.row] objectForKey:@"id"];
    if([identificador isEqualToString:@"azulFisica"]) {
        FisicaIndustrialViewController *controller = [[FisicaIndustrialViewController alloc] initWithNibName:@"FisicaIndustrialViewController" bundle:nil];
        [self.delegado cambiarViewController:controller withArray:nil];
    }
}

@end
