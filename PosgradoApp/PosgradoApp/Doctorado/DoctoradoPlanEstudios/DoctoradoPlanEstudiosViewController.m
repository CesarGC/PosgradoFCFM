//
//  MaestriaPlanEstudiosViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 07/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "DoctoradoPlanEstudiosViewController.h"
#import "DoctoradoPlanCompletoTableViewCell.h"
#import "DoctoradoPlanSemestreTableViewCell.h"
#import "MaestriaPDFViewController.h"

@interface DoctoradoPlanEstudiosViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tablaOptativas;
@property (weak, nonatomic) IBOutlet UITableView *tablaPlanEstudioTiempoCompleto;
@property (strong, nonatomic) NSMutableArray *arrayOptativas;
@property (strong, nonatomic) NSMutableArray *arrayPlanCompleto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightCompleto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightOptativas;

@end

@implementation DoctoradoPlanEstudiosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tablaOptativas.delegate = self;
    self.tablaOptativas.dataSource = self;
    self.tablaPlanEstudioTiempoCompleto.delegate = self;
    self.tablaPlanEstudioTiempoCompleto.dataSource = self;
    
    [self.tablaPlanEstudioTiempoCompleto registerNib:[UINib nibWithNibName:@"DoctoradoPlanCompletoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellPlanDoctorado"];
    [self.tablaPlanEstudioTiempoCompleto registerNib:[UINib nibWithNibName:@"DoctoradoPlanSemestreTableViewCell" bundle:nil] forCellReuseIdentifier:@"DoctoradoSemestre"];
    
    [self.tablaOptativas registerNib:[UINib nibWithNibName:@"DoctoradoPlanCompletoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellPlanDoctorado"];
    [self.tablaOptativas registerNib:[UINib nibWithNibName:@"DoctoradoPlanSemestreTableViewCell" bundle:nil] forCellReuseIdentifier:@"DoctoradoSemestre"];
    
    self.tablaOptativas.rowHeight = UITableViewAutomaticDimension;
    self.tablaOptativas.estimatedRowHeight = 140;
    self.tablaPlanEstudioTiempoCompleto.rowHeight = UITableViewAutomaticDimension;
    self.tablaPlanEstudioTiempoCompleto.estimatedRowHeight = 140;
    
    [self llenarDatosTablaPlanCompleto];
    [self.tablaPlanEstudioTiempoCompleto reloadData];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //This code will run in the main thread:
        CGRect frame = self.tablaPlanEstudioTiempoCompleto.frame;
        frame.size.height = self.tablaPlanEstudioTiempoCompleto.contentSize.height;
        self.constraintHeightCompleto.constant = frame.size.height;
    });
    
    
    [self llenarArregloOptativas];
    [self.tablaOptativas reloadData];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //This code will run in the main thread:
        CGRect frame = self.tablaOptativas.frame;
        frame.size.height = self.tablaOptativas.contentSize.height;
        self.constraintHeightOptativas.constant = frame.size.height;
    });
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.constraintHeightCompleto.constant = self.tablaPlanEstudioTiempoCompleto.contentSize.height;
    self.constraintHeightOptativas.constant = self.tablaOptativas.contentSize.height;
}

- (void)llenarDatosTablaPlanCompleto {
    NSArray *array = @[
                       @{@"materia":@"MATERIA", @"horas":@"HRS/SEM", @"credito":@"CREDITOS", @"tipo":@"1"},
                       @{@"semestre":@"PRIMER SEMESTRE", @"tipo":@"2"},
                       @{@"materia":@"Fundamentos de Nanotecnología", @"horas":@"3", @"credito":@"5", @"tipo":@"1"},
                       @{@"materia":@"Fundamentos de Fotónica", @"horas":@"3", @"credito":@"5", @"tipo":@"1"},
                       @{@"materia":@"Fundamentos de Control", @"horas":@"3", @"credito":@"5", @"tipo":@"1"},
                       @{@"materia":@"Fundamentos de Física Teórica", @"horas":@"3", @"credito":@"5", @"tipo":@"1"},
                       @{@"semestre":@"SEGUNDO SEMESTRE", @"tipo":@"2"},
                       @{@"materia":@"Anteproyecto de Tesis", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Investigación Básica", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Cómputo Científico", @"horas":@"3", @"credito":@"4", @"tipo":@"1"},
                       @{@"semestre":@"TERCER SEMESTRE", @"tipo":@"2"},
                       @{@"materia":@"Seminario de Investigación", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Optativa de Formación", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Avances de Anteproyecto de Tesis", @"horas":@"3", @"credito":@"4", @"tipo":@"1"},
                       @{@"semestre":@"CUARTO SEMESTRE", @"tipo":@"2"},
                       @{@"materia":@"Técnicas y Modelos de la Ingeniería Física", @"horas":@"3", @"credito":@"20", @"tipo":@"1"},
                       @{@"semestre":@"QUINTO SEMESTRE", @"tipo":@"2"},
                       @{@"materia":@"Iniciación de Tesis", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Investigación Avanzada", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Libre Elección I", @"horas":@"3", @"credito":@"4", @"tipo":@"1"},
                       @{@"semestre":@"SEXTO SEMESTRE", @"tipo":@"2"},
                       @{@"materia":@"Producción de Tesis", @"horas":@"3", @"credito":@"12", @"tipo":@"1"},
                       @{@"materia":@"Libre Elección II", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"semestre":@"SEPTIMO SEMESTRE", @"tipo":@"2"},
                       @{@"materia":@"Tesis I", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Predefensa de Tesis", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Elaboración de Artículos", @"horas":@"3", @"credito":@"4", @"tipo":@"1"},
                       @{@"semestre":@"OCTAVO SEMESTRE", @"tipo":@"2"},
                       @{@"materia":@"Tesis II", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Optativa de Divulgación", @"horas":@"3", @"credito":@"8", @"tipo":@"1"},
                       @{@"materia":@"Reuniones Científicas", @"horas":@"3", @"credito":@"4", @"tipo":@"1"},
                       ];
    
    self.arrayPlanCompleto = [[NSMutableArray alloc] initWithArray:array];
}

- (void)llenarArregloOptativas {
    NSArray *array = @[
                       @{@"materia":@"Análisis	Funcional",@"tipo":@"3"},
                       @{@"materia":@"Aplicaciones de Cálculo Fraccional en Materiales",@"tipo":@"3"},
                       @{@"materia":@"METODOS MATEMATICOS DE LA FISICA I",@"tipo":@"3"},
                       @{@"materia":@"ELECTRODINAMICA CLASICA II",@"tipo":@"3"},
                       @{@"materia":@"METODOS MATEMATICOS DE LA FISICA II",@"tipo":@"3"},
                       @{@"materia":@"FISICA MODERNA",@"tipo":@"3"},
                       @{@"materia":@"PROYECTO DE INVESTIGACION I",@"tipo":@"3"},
                       @{@"materia":@"TESIS I",@"tipo":@"3"},
                       @{@"materia":@"PROYECTO DE INVESTIGACION II",@"tipo":@"3"},
                       @{@"materia":@"TESIS II",@"tipo":@"3"},
                       @{@"materia":@"SEMINARIO",@"tipo":@"3"},
                       @{@"materia":@"SIMULACION DE SISTEMAS SOLIDOS",@"tipo":@"3"},
                       @{@"materia":@"ESTADO SOLIDO",@"tipo":@"3"},
                       @{@"materia":@"FISICA DE SUPERFICIES",@"tipo":@"3"},
                       @{@"materia":@"PREPARACION Y CARACTERIZACION  DE NANOPARTICULAS",@"tipo":@"3"},
                       @{@"materia":@"TECNICAS EXPERIM. EN NANOCIENCIAS Y NANOTECNOLOGIA",@"tipo":@"3"},
                       @{@"materia":@"ANALISIS DE SEÑALES BIOMEDICAS I",@"tipo":@"3"},
                       @{@"materia":@"ANALISIS DE SEÑALES BIOMEDICAS II",@"tipo":@"3"},
                       @{@"materia":@"METODOS NUMERICOS ESPECIALES",@"tipo":@"3"},
                       @{@"materia":@"FISICA MODERNA",@"tipo":@"3"},
                       @{@"materia":@"TEORIA ELECTROMAGNETICA",@"tipo":@"3"},
                       @{@"materia":@"PROCESOS ESTOCASTICOS I",@"tipo":@"3"},
                       @{@"materia":@"METODOS MATEMATICOS DE LA FISICA I",@"tipo":@"3"},
                       @{@"materia":@"INVESTIGACION DE OPERACIONES",@"tipo":@"3"},
                       @{@"materia":@"FISICA DE LOS SISTEMAS DE BAJA DIMENSIONALIDAD",@"tipo":@"3"},
                       @{@"materia":@"CONTROL OPTIMO",@"tipo":@"3"},
                       @{@"materia":@"TOPICOS DE FOTONICA",@"tipo":@"3"},
                       @{@"materia":@"CUMULOS METALICOS",@"tipo":@"3"},
                       @{@"materia":@"INTRODUCCION A LA TEORIA DE CONTROL AUTOMATICO",@"tipo":@"3"},
                       @{@"materia":@"CRISTALES SUPREMOLECULARES",@"tipo":@"3"},
                       @{@"materia":@"METODOS DE SINTESIS DE NANOESTRUCTURAS",@"tipo":@"3"},
                       @{@"materia":@"SINTESIS Y CARACTERIZACION DE PELICULAS DELGADAS",@"tipo":@"3"},
                       @{@"materia":@"METODOS MATEMATICOS DE CONTROL",@"tipo":@"3"},
                       @{@"materia":@"SISTEMAS DINAMICOS NO LINEALES I",@"tipo":@"3"},
                       @{@"materia":@"OPTICA FISICA",@"tipo":@"3"},
                       @{@"materia":@"FISICA CUANTICA",@"tipo":@"3"},
                       @{@"materia":@"FISICA DE PLASMAS",@"tipo":@"3"},
                       @{@"materia":@"INTRODUCCION A LA FUSION",@"tipo":@"3"},
                       @{@"materia":@"FISICA DE CELDAS SOLARES",@"tipo":@"3"},
                       @{@"materia":@"INTRODUCCION A LA NANOTECNOLOGIA",@"tipo":@"3"},
                       @{@"materia":@"TOPICOS AVANZADOS DE FOTONICA",@"tipo":@"3"},
                       @{@"materia":@"METODOS APLICADOS EN MICROSCOPIA ATOMICA",@"tipo":@"3"},
                       @{@"materia":@"QUIMICA DE MATERIALES",@"tipo":@"3"},
                       @{@"materia":@"ESPECTROSCOPIAS",@"tipo":@"3"},
                       @{@"materia":@"RADIOMETRIA",@"tipo":@"3"},
                       ];
    
    self.arrayOptativas = [[NSMutableArray alloc] initWithArray:array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.tablaPlanEstudioTiempoCompleto) {
        return self.arrayPlanCompleto.count;
    } else if(tableView == self.tablaOptativas) {
        return self.arrayOptativas.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    NSDictionary *dicc;
    
    if(tableView == self.tablaPlanEstudioTiempoCompleto) {
        dicc = [self.arrayPlanCompleto objectAtIndex:indexPath.row];
        if([[dicc objectForKey:@"tipo"] isEqualToString:@"1"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellPlanDoctorado"];
            [(DoctoradoPlanCompletoTableViewCell *)cell actualizaInformacion:[self.arrayPlanCompleto objectAtIndex:indexPath.row]];
        } else {
            cell = [tableView dequeueReusableCellWithIdentifier:@"DoctoradoSemestre"];
            [(DoctoradoPlanSemestreTableViewCell *)cell actualizaInfoSemestre:[self.arrayPlanCompleto objectAtIndex:indexPath.row]];
        }
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"DoctoradoSemestre"];
        [(DoctoradoPlanSemestreTableViewCell *)cell actualizaInfoSemestre:[self.arrayOptativas objectAtIndex:indexPath.row]];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)actionPDF:(id)sender {
    
    MaestriaPDFViewController *controller = [[MaestriaPDFViewController alloc] initWithNibName:@"MaestriaPDFViewController" bundle:nil];
    //    [self presentViewController:controller animated:YES completion:^{
    //        
    //    }];
//    [self.delegado presentarPDFController:controller];
}

@end
