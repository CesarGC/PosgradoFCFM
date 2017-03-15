//
//  MaestriaProfesoresViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 14/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "DoctoradoProfesoresViewController.h"
#import "MaestriaProfesoresTableViewCell.h"

@interface DoctoradoProfesoresViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tablaProfesores;
@property (strong, nonatomic) NSMutableArray *arregloProfesores;

@end

@implementation DoctoradoProfesoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tablaProfesores.dataSource = self;
    self.tablaProfesores.delegate = self;
    self.arregloProfesores = [[NSMutableArray alloc] initWithArray:@[
                                                                     @{@"profesor":@"Dr. Romeo de Jesús Selvas Aguilar"},
                                                                     @{@"profesor":@"Dr. Arturo Alberto Castillo Guzmán"},
                                                                     @{@"profesor":@"Dr. Carlos Luna Criado"},
                                                                     @{@"profesor":@"Dr. José Rubén Morones Ibarra"},
                                                                     @{@"profesor":@"Dr. Manuel Alejandro Jiménez Lizárraga"},
                                                                     @{@"profesor":@"Dr. Sergio Javier Mejía Rosales"},
                                                                     @{@"profesor":@"Dr. Eduardo Pérez Tijerina"},
                                                                     @{@"profesor":@"Dr. Ricardo Iván Álvarez Tamayo"},
                                                                     @{@"profesor":@"Dra. María Aracelia Alcorta García"},
                                                                     @{@"profesor":@"Dr. Mikhail Valentinovich Basin"},
                                                                     @{@"profesor":@"Dr. Oxana Vasilievna Kharissova"},
                                                                     @{@"profesor":@"Dr. Jorge Luis Menchaca Arredondo"}]];
    [self.tablaProfesores registerNib:[UINib nibWithNibName:@"MaestriaProfesoresTableViewCell" bundle:nil] forCellReuseIdentifier:@"maestriaProfesor"];
    [self.tablaProfesores reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MaestriaProfesoresTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maestriaProfesor" forIndexPath:indexPath];
    [cell actualizarDatos:[self.arregloProfesores objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arregloProfesores.count;
}

- (IBAction)selectedTypeProfesor:(id)sender {
    UISegmentedControl *control = sender;
    if([control selectedSegmentIndex] == 0) {
        self.arregloProfesores = [[NSMutableArray alloc] initWithArray:@[
                                                                         @{@"profesor":@"Dr. Romeo de Jesús Selvas Aguilar"},
                                                                         @{@"profesor":@"Dr. Arturo Alberto Castillo Guzmán"},
                                                                         @{@"profesor":@"Dr. Carlos Luna Criado"},
                                                                         @{@"profesor":@"Dr. José Rubén Morones Ibarra"},
                                                                         @{@"profesor":@"Dr. Manuel Alejandro Jiménez Lizárraga"},
                                                                         @{@"profesor":@"Dr. Sergio Javier Mejía Rosales"},
                                                                         @{@"profesor":@"Dr. Eduardo Pérez Tijerina"},
                                                                         @{@"profesor":@"Dr. Ricardo Iván Álvarez Tamayo"},
                                                                         @{@"profesor":@"Dra. María Aracelia Alcorta García"},
                                                                         @{@"profesor":@"Dr. Mikhail Valentinovich Basin"},
                                                                         @{@"profesor":@"Dr. Oxana Vasilievna Kharissova"},
                                                                         @{@"profesor":@"Dr. Jorge Luis Menchaca Arredondo"}]];
    } else {
        self.arregloProfesores = [[NSMutableArray alloc] initWithArray:@[
                                                                         @{@"profesor":@"Dr. Edgar Martínez Guerra"},
                                                                         @{@"profesor":@"Dr. Miguel Ángel Gracia Pinilla"},
                                                                         @{@"profesor":@"Dr. Omar González Amezcua"},
                                                                         @{@"profesor":@"Dr. Sergio Belmares Perales"},
                                                                         @{@"profesor":@"Dra. Nora Elizondo Villarreal"},
                                                                         @{@"profesor":@"Dr. Alfredo Tlahuice Flores"},
                                                                         @{@"profesor":@"Dra. Diana Berenice Hernández Uresti"}]];
    }
    [self.tablaProfesores reloadData];
}

@end
