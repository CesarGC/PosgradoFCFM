//
//  MaestriaProfesoresViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 14/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MaestriaProfesoresViewController.h"
#import "MaestriaProfesoresTableViewCell.h"

@interface MaestriaProfesoresViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tablaProfesores;
@property (strong, nonatomic) NSMutableArray *arregloProfesores;

@end

@implementation MaestriaProfesoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tablaProfesores.dataSource = self;
    self.tablaProfesores.delegate = self;
    self.arregloProfesores = [[NSMutableArray alloc] initWithArray:@[@{@"profesor":@"Dr. Arturo Alberto Castillo Guzmán"},@{@"profesor":@"Dr. Carlos Luna Criado"},@{@"profesor":@"Dr. Daniel Enrique Ceballos Herrera"},@{@"profesor":@"Dr. Eduardo Gerardo Pérez Tijerina"},@{@"profesor":@"Dr. José Rubén Morones Ibarra"},@{@"profesor":@"Dr. Manuel Alejandro Jiménez Lizarraga"},@{@"profesor":@"Dr. Mikhail Valentinovich Basin"},@{@"profesor":@"Dr. Pablo César Rodríguez Ramírez"},@{@"profesor":@"Dr. Romeo de Jesús Selvas Aguilar"},@{@"profesor":@"Dr. Sergio Javier Mejía Rosales"},@{@"profesor":@"Dra. Nora Elizondo Villarreal"},@{@"profesor":@"Dra. Oxana Vasilievna Kharissova"}]];
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
        self.arregloProfesores = [[NSMutableArray alloc] initWithArray:@[@{@"profesor":@"Dr. Romeo de Jesús Selvas Aguilar"},@{@"profesor":@"Dr. Arturo Alberto Castillo Guzmán"},@{@"profesor":@"Dr. Carlos Luna Criado"},@{@"profesor":@"Dr. José Rubén Morones Ibarra"},@{@"profesor":@"Dr. Manuel Alejandro Jiménez Lizárraga"},@{@"profesor":@"Dr. Sergio Javier Mejía Rosales"},@{@"profesor":@"Dr. Eduardo Pérez Tijerina"},@{@"profesor":@"Dr. Ricardo Iván Álvarez Tamayo"},@{@"profesor":@"Dra. María Aracelia Alcorta García"},@{@"profesor":@"Dr. Francisco Javier Almaguer Martínez"},@{@"profesor":@"Dr. Oxana Vasilievna Kharissova"},@{@"profesor":@"Dr. Jorge Luis Menchaca Arredondo"}]];
    } else {
        self.arregloProfesores = [[NSMutableArray alloc] initWithArray:@[@{@"profesor":@"Dr. Edgar Martínez Guerra"},@{@"profesor":@"Dr. Miguel Ángel Gracia Pinilla"},@{@"profesor":@"Dr. Omar González Amezcua"},@{@"profesor":@"Dr. Sergio Belmares Perales"},@{@"profesor":@"Dra. Nora Elizondo Villarreal"},@{@"profesor":@"Dr. Alfredo Tlahuice Flores"},@{@"profesor":@"Dra. Diana Berenice Hernández Uresti"},@{@"profesor":@"Dr. Claudio Davet Guitérrez Lazos"},@{@"profesor":@"Dr. Pablo César Rodríguez Ramírez"},@{@"profesor":@"Dr. Mikhail Valentinovich Basin"},@{@"profesor":@"Dr. Francisco José Solis Pomar"},@{@"profesor":@"Dr. Guillermo Salceda Delgado"},@{@"profesor":@"Dr. Joel Pérez Padrón"},@{@"profesor":@"Dra. Raquel Mendoza Reséndez"},@{@"profesor":@"Dr. Francisco Vicente Flores Báez"},@{@"profesor":@"Dr. Sergio Alberto Obregón Alfaro"}, @{@"profesor":@"Dr. Valentín Guzmán Ramos"}]];
    }
    [self.tablaProfesores reloadData];
}

@end
