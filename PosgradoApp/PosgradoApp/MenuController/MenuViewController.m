//
//  MenuViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 15/12/16.
//  Copyright © 2016 Servicio Social. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"
#import "MaestriaObjetivosViewController.h"
#import "MaestriaRequisitosViewController.h"
#import "MaestriaPlanEstudiosViewController.h"
#import "MaestriaProfesoresViewController.h"
#import "MaestriaProcesosAdministrativosViewController.h"
#import "MaestriaPerfilesViewController.h"
#import "DoctoradoObjetivosViewController.h"
#import "DoctoradoRequisitosViewController.h"
#import "DoctoradoPlanEstudiosViewController.h"
#import "DoctoradoProfesoresViewController.h"
#import "DoctoradoProcesosAdministrativosViewController.h"
#import "DoctoradoPerfilesViewController.h"

@interface MenuViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tablaMenu;
@property (nonatomic, strong, readwrite) NSMutableArray *arrayMenu;

@end

@implementation MenuViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withIdentifier:(NSString *)identifier {
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.identifier = identifier;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withArray:(NSArray *)arrayMenu {
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.arrayMenu = [[NSMutableArray alloc] initWithArray:arrayMenu];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tablaMenu registerNib:[UINib nibWithNibName:@"MenuTableViewCell" bundle:nil]  forCellReuseIdentifier:@"menuTabla"];
    //    self.arrayMenu = [self enviarArray:@"maestria"];
    self.tablaMenu.delegate = self;
    self.tablaMenu.dataSource = self;
    [self.tablaMenu reloadData];
}

- (void)cambiarArrayMenu:(NSArray *)array withIdentifier:(NSString *)identifier {
    self.arrayMenu = [self enviarArray:identifier];
    [self.tablaMenu reloadData];
}

- (NSMutableArray *)enviarArray:(NSString *)identificador {
    NSMutableArray *arrayMenu = [[NSMutableArray alloc] init];
    
    if([identificador isEqualToString:@"maestria"]) {
        NSDictionary *dic3 = @{@"id":@"maestriaObjetivos", @"titulo":@"Objetivos"};
        NSDictionary *dic4 = @{@"id":@"maestriaRequisitos", @"titulo":@"Requisitos"};
        NSDictionary *dic5 = @{@"id":@"maestriaPlanEstudio", @"titulo":@"Plan de estudios"};
        NSDictionary *dic6 = @{@"id":@"maestriaProfesores", @"titulo":@"Profesores"};
        NSDictionary *dic10 = @{@"id":@"maestriaProcesoAdmin", @"titulo":@"Procesos administrativos"};
        NSDictionary *dic14 = @{@"id":@"maestriaPerfiles", @"titulo":@"Perfiles"};
        
        [arrayMenu addObject:dic3];
        [arrayMenu addObject:dic4];
        [arrayMenu addObject:dic5];
        [arrayMenu addObject:dic6];
        [arrayMenu addObject:dic10];
        [arrayMenu addObject:dic14];
        
    } else if([identificador isEqualToString:@"doctorado"]) {
        NSDictionary *dic3 = @{@"id":@"doctoradoObjetivos", @"titulo":@"Objetivos"};
        NSDictionary *dic4 = @{@"id":@"doctoradoRequisitos", @"titulo":@"Requisitos"};
        NSDictionary *dic5 = @{@"id":@"doctoradoPlanEstudio", @"titulo":@"Plan de estudios"};
        NSDictionary *dic6 = @{@"id":@"doctoradoProfesores", @"titulo":@"Profesores"};
        NSDictionary *dic10 = @{@"id":@"doctoradoProcesoAdmin", @"titulo":@"Procesos administrativos"};
        NSDictionary *dic14 = @{@"id":@"doctoradoPerfiles", @"titulo":@"Perfiles"};
        
        [arrayMenu addObject:dic3];
        [arrayMenu addObject:dic4];
        [arrayMenu addObject:dic5];
        [arrayMenu addObject:dic6];
        [arrayMenu addObject:dic10];
        [arrayMenu addObject:dic14];
    }
    
    return arrayMenu;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuTabla" forIndexPath:indexPath];
    [cell actualizarDatos:[self.arrayMenu objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayMenu.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dicc = [self.arrayMenu objectAtIndex:indexPath.row];
    NSString *identificador = [dicc objectForKey:@"id"];
    UIViewController *controller = nil;
    if([identificador isEqualToString:@"maestriaObjetivos"]) {
        controller = [[MaestriaObjetivosViewController alloc] initWithNibName:@"MaestriaObjetivosViewController" bundle:nil];
    } else if([identificador isEqualToString:@"maestriaRequisitos"]) {
        controller = [[MaestriaRequisitosViewController alloc] initWithNibName:@"MaestriaRequisitosViewController" bundle:nil];
    } else if([identificador isEqualToString:@"maestriaPlanEstudio"]) {
        controller = [[MaestriaPlanEstudiosViewController alloc] initWithNibName:@"MaestriaPlanEstudiosViewController" bundle:nil];
    } else if([identificador isEqualToString:@"maestriaProfesores"]) {
        controller = [[MaestriaProfesoresViewController alloc] initWithNibName:@"MaestriaProfesoresViewController" bundle:nil];
    } else if([identificador isEqualToString:@"maestriaProcesoAdmin"]) {
        controller = [[MaestriaProcesosAdministrativosViewController alloc] initWithNibName:@"MaestriaProcesosAdministrativosViewController" bundle:nil];
    } else if([identificador isEqualToString:@"maestriaPerfiles"]) {
        controller = [[MaestriaPerfilesViewController alloc] initWithNibName:@"MaestriaPerfilesViewController" bundle:nil];
    } else if([identificador isEqualToString:@"doctoradoObjetivos"]) {
        controller = [[DoctoradoObjetivosViewController alloc] initWithNibName:@"DoctoradoObjetivosViewController" bundle:nil];
    } else if([identificador isEqualToString:@"doctoradoRequisitos"]) {
        controller = [[DoctoradoRequisitosViewController alloc] initWithNibName:@"DoctoradoRequisitosViewController" bundle:nil];
    } else if([identificador isEqualToString:@"doctoradoPlanEstudio"]) {
        controller = [[DoctoradoPlanEstudiosViewController alloc] initWithNibName:@"DoctoradoPlanEstudiosViewController" bundle:nil];
    } else if([identificador isEqualToString:@"doctoradoProfesores"]) {
        controller = [[DoctoradoProfesoresViewController alloc] initWithNibName:@"DoctoradoProfesoresViewController" bundle:nil];
    } else if([identificador isEqualToString:@"doctoradoProcesoAdmin"]) {
        controller = [[DoctoradoProcesosAdministrativosViewController alloc] initWithNibName:@"DoctoradoProcesosAdministrativosViewController" bundle:nil];
    } else if([identificador isEqualToString:@"doctoradoPerfiles"]) {
        controller = [[DoctoradoPerfilesViewController alloc] initWithNibName:@"DoctoradoPerfilesViewController" bundle:nil];
    }
    if(controller) {
        [self.delegado cambiarViewController:controller];
    }
}

@end
