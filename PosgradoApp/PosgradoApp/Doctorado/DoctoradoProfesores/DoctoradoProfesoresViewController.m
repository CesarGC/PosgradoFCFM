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
                                                                     @{@"profesor":@"Dr. Arturo Alberto Castillo Guzmán"},
                                                                     @{@"profesor":@"Dr. Carlos Luna Criado"},
                                                                     @{@"profesor":@"Dr. Daniel Enrique Ceballos Herrera"},
                                                                     @{@"profesor":@"Dr. Eduardo Gerardo Pérez Tijerina"},
                                                                     @{@"profesor":@"Dr. Manuel Alejandro Jiménez Lizarraga"},
                                                                     @{@"profesor":@"Dr. Manuel García Méndez"},
                                                                     @{@"profesor":@"Dr. Mikhail Valentinovich Basin"},
                                                                     @{@"profesor":@"Dr. Pablo César Rodríguez Ramírez"},
                                                                     @{@"profesor":@"Dr. Romeo de Jesús Selvas Aguilar"},
                                                                     @{@"profesor":@"Dr. Sergio Javier Mejía Rosales"},
                                                                     @{@"profesor":@"Dra. Nora Elizondo Villarreal"},
                                                                     @{@"profesor":@"Dra. Oxana Vasilievna Kharissova"}]];
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
                                                                         @{@"profesor":@"Dr. Arturo Alberto Castillo Guzmán"},
                                                                         @{@"profesor":@"Dr. Carlos Luna Criado"},
                                                                         @{@"profesor":@"Dr. Daniel Enrique Ceballos Herrera"},
                                                                         @{@"profesor":@"Dr. Eduardo Gerardo Pérez Tijerina"},
                                                                         @{@"profesor":@"Dr. Manuel Alejandro Jiménez Lizarraga"},
                                                                         @{@"profesor":@"Dr. Manuel García Méndez"},
                                                                         @{@"profesor":@"Dr. Mikhail Valentinovich Basin"},
                                                                         @{@"profesor":@"Dr. Pablo César Rodríguez Ramírez"},
                                                                         @{@"profesor":@"Dr. Romeo de Jesús Selvas Aguilar"},
                                                                         @{@"profesor":@"Dr. Sergio Javier Mejía Rosales"},
                                                                         @{@"profesor":@"Dra. Nora Elizondo Villarreal"},
                                                                         @{@"profesor":@"Dra. Oxana Vasilievna Kharissova"}]];
    } else {
        self.arregloProfesores = [[NSMutableArray alloc] initWithArray:@[
                                                                         @{@"profesor":@"Dr. Edgar Martínez Guerra"},
                                                                         @{@"profesor":@"Dr. Javier Fco. Almaguer  Martínez"},
                                                                         @{@"profesor":@"Dr. Joel  Pérez Padrón"},
                                                                         @{@"profesor":@"Dr. Jorge Luis Menchaca Arredondo"},
                                                                         @{@"profesor":@"Dr. José Rubén Morones Ibarra"},
                                                                         @{@"profesor":@"Dr. María Aracelia Alcorta García"},
                                                                         @{@"profesor":@"Dr. Miguel Ángel Gracia Pinilla"},
                                                                         @{@"profesor":@"Dr. Omar González Amezcua"},
                                                                         @{@"profesor":@"Dr. Sergio Belmares Perales"}]];
    }
    [self.tablaProfesores reloadData];
}

@end
