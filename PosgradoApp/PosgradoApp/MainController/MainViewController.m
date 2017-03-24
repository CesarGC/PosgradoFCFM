//
//  MainViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 13/12/16.
//  Copyright © 2016 Servicio Social. All rights reserved.
//

#import "MainViewController.h"
#import "MainCollectionViewCell.h"
#import "MainTableViewCell.h"
#import "TablaMaestriaViewController.h"
#import "MapaPosgradoViewController.h"
#import "FisicaIndustrialViewController.h"
#import "ContactoViewController.h"
#import "DoctoradoFisicaIndustrialViewController.h"

@interface MainViewController ()

//@property (weak, nonatomic) IBOutlet UITableView *tableViewMain;
@property (strong, nonatomic) NSArray *arrayMenu;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayMenu = @[@{@"id":@"maestria", @"image":@"master", @"name":@"Maestrias"}, @{@"id":@"doctor", @"image":@"doctor", @"name":@"Doctorados"}, @{@"id":@"ubicacion", @"image":@"ubicacion", @"name":@"Ubicación"}, @{@"id":@"noticia", @"image":@"noticias", @"name":@"Noticias"}, @{@"id":@"pregunta", @"image":@"pregunta", @"name":@"Preguntas frecuentes"}];
    
    //self.tableViewMain.delegate = self;
    //self.tableViewMain.dataSource = self;
    //[self.tableViewMain registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"mainTableCell"];
    //self.tableViewMain.estimatedRowHeight = 100.0;
    //self.tableViewMain.rowHeight = UITableViewAutomaticDimension;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainTableCell" forIndexPath:indexPath];
//    [cell actualizarCelda:[self.arrayMenu objectAtIndex:indexPath.row]];
//    return cell;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.arrayMenu.count;
//}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *identificador = [(NSDictionary *)[self.arrayMenu objectAtIndex:indexPath.row] objectForKey:@"id"];
//    if([identificador isEqualToString:@"ubicacion"]) {
//        MapaPosgradoViewController *controller = [[MapaPosgradoViewController alloc] initWithNibName:@"MapaPosgradoViewController" bundle:nil];
//        [self.delegado cambiarViewController:controller withArray:nil];
//    } else if([identificador isEqualToString:@"maestria"]) {
//        TablaMaestriaViewController *controller = [[TablaMaestriaViewController alloc] initWithNibName:@"TablaMaestriaViewController" bundle:nil];
//        [self.delegado cambiarViewController:controller withArray:nil];
//    }
//}

- (IBAction)mapAction:(id)sender {
    NSLog(@"Entro");
    MapaPosgradoViewController *controller = [[MapaPosgradoViewController alloc] initWithNibName:@"MapaPosgradoViewController" bundle:nil];
    [self.delegado cambiarViewController:controller withArray:nil];
}



- (void)cambiaController:(NSDictionary *)dicc {
    if ([dicc objectForKey:@""]) {
        
    }
}

- (IBAction)entroMaestria:(id)sender {
    FisicaIndustrialViewController *controller = [[FisicaIndustrialViewController alloc] initWithNibName:@"FisicaIndustrialViewController" bundle:nil];
    [self.delegado cambiarViewController:controller withArray:nil];
}


- (IBAction)entroDoctorado:(id)sender {
    DoctoradoFisicaIndustrialViewController *controller = [[DoctoradoFisicaIndustrialViewController alloc] initWithNibName:@"DoctoradoFisicaIndustrialViewController" bundle:nil];
    [self.delegado cambiarViewController:controller withArray:nil];
}

- (IBAction)entroContacto:(id)sender {
    ContactoViewController *controller = [[ContactoViewController alloc] initWithNibName:@"ContactoViewController" bundle:nil];
    [self.delegado cambiarViewController:controller withArray:nil];
}

@end
