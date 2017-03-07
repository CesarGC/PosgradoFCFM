//
//  MaestriaPlanEstudiosViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 07/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MaestriaPlanEstudiosViewController.h"
#import "MaestriaPlanCompletoTableViewCell.h"

@interface MaestriaPlanEstudiosViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITableView *tablaPlanEstudioTiempoCompleto;
@property (weak, nonatomic) IBOutlet UITableView *tablaPlanEstudioTiempoParcial;
@property (weak, nonatomic) IBOutlet UITableView *tablaOptativas;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightCompleto;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightParcial;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightOptativas;
@property (strong, nonatomic) NSMutableArray *arrayPlanCompleto;
@property (strong, nonatomic) NSMutableArray *arrayPlanParcial;
@property (strong, nonatomic) NSMutableArray *arrayOptativas;

@end

@implementation MaestriaPlanEstudiosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"plan_estudio" withExtension:@"html"];
    NSError *error;
    NSString *contentString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    NSURL *baseUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    [self.webView loadHTMLString:contentString baseURL:baseUrl];
    
    self.tablaOptativas.delegate = self;
    self.tablaOptativas.dataSource = self;
    self.tablaPlanEstudioTiempoParcial.delegate = self;
    self.tablaPlanEstudioTiempoParcial.dataSource = self;
    self.tablaPlanEstudioTiempoCompleto.delegate = self;
    self.tablaPlanEstudioTiempoCompleto.dataSource = self;
    
    [self.tablaPlanEstudioTiempoCompleto registerNib:[UINib nibWithNibName:@"MaestriaPlanCompletoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellPlanMaestria"];
    [self.tablaPlanEstudioTiempoParcial registerNib:[UINib nibWithNibName:@"MaestriaPlanCompletoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellPlanMaestria"];
    
    self.tablaOptativas.rowHeight = UITableViewAutomaticDimension;
    self.tablaOptativas.estimatedRowHeight = 140;
    self.tablaPlanEstudioTiempoParcial.rowHeight = UITableViewAutomaticDimension;
    self.tablaPlanEstudioTiempoParcial.estimatedRowHeight = 140;
    self.tablaPlanEstudioTiempoCompleto.rowHeight = UITableViewAutomaticDimension;
    self.tablaPlanEstudioTiempoCompleto.estimatedRowHeight = 140;
    
}

- (void)llenarDatosTablaPlanCompleto {
    NSArray *array = @[
  @{@"materia":@"MATERIA", @"horas":@"HRS/SEM", @"credito":@"CREDITOS", @"tipo":@"1"},
  @{@"semestre":@"PRIMER SEMESTRE", @"tipo":@"2"},
  @{@"materia":@"Electrodinámica Clásica I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"materia":@"Mecánica Clásica", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"materia":@"Métodos Matemáticos de la Física I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"semestre":@"SEGUNDO SEMESTRE", @"tipo":@"2"},
  @{@"materia":@"Electrodinámica Clásica II", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"materia":@"Métodos Matemáticos de la Física II", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"materia":@"Física Moderna", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"semestre":@"TERCER SEMESTRE", @"tipo":@"2"},
  @{@"materia":@"Optativa I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"materia":@"Optativa II", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"materia":@"Proyecto de Investigación I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"materia":@"Tesis I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"semestre":@"CUARTO SEMESTRE", @"tipo":@"2"},
  @{@"materia":@"Optativa III", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"materia":@"Tesis II", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"materia":@"Seminario", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
  @{@"semestre":@"PRESENTACION DE TESIS PARA OBTENER EL GRADO DE: MASTER EN INGENIERÍA FÍSICA INDUSTRÍAL", @"tipo":@"2"},
  ];

    self.arrayPlanCompleto = [[NSMutableArray alloc] initWithArray:array];
}

- (void)llenarArrayParcial {
    NSArray *array = @[
    @{@"materia":@"MATERIA", @"horas":@"HRS/SEM", @"credito":@"CREDITOS", @"tipo":@"1"},
    @{@"semestre":@"PRIMER SEMESTRE", @"tipo":@"2"},
    @{@"materia":@"Electrodinámica Clásica I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    @{@"materia":@"Mecánica Clásica", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    
    
    @{@"semestre":@"SEGUNDO SEMESTRE", @"tipo":@"2"},
    @{@"materia":@"Métodos Matemáticos de la Física I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    @{@"materia":@"Electrodinámica Clásica II", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    
    @{@"semestre":@"TERCER SEMESTRE", @"tipo":@"2"},
    @{@"materia":@"Métodos Matemáticos de la Física II", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    @{@"materia":@"Física Moderna", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    
    @{@"semestre":@"CUARTO SEMESTRE", @"tipo":@"2"},
    @{@"materia":@"Optativa I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    @{@"materia":@"Optativa II", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    
    @{@"semestre":@"QUINTO SEMESTRE", @"tipo":@"2"},
    @{@"materia":@"Proyecto de Investigación I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    @{@"materia":@"Optativa III", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    
    @{@"semestre":@"SEXTO SEMESTRE", @"tipo":@"2"},
    @{@"materia":@"Proyecto de Investigación II", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    @{@"materia":@"Seminario", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    
    @{@"semestre":@"SÉPTIMO SEMESTRE", @"tipo":@"2"},
    @{@"materia":@"Tesis I", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    
    @{@"semestre":@"OCTAVO SEMESTRE", @"tipo":@"2"},
    @{@"materia":@"Tesis II", @"horas":@"3", @"credito":@"6", @"tipo":@"1"},
    
    @{@"semestre":@"PRESENTACION DE TESIS PARA OBTENER EL GRADO DE: MASTER EN INGENIERÍA FÍSICA INDUSTRÍAL", @"tipo":@"2"},
    ];
    /*
     ELECTRODINAMICA CLASICA I
     MECANICA CLASICA
     METODOS MATEMATICOS DE LA FISICA I
     ELECTRODINAMICA CLASICA II
     METODOS MATEMATICOS DE LA FISICA II
     FISICA MODERNA
     
     PROYECTO DE INVESTIGACION I
     TESIS I
     PROYECTO DE INVESTIGACION II
     TESIS II
     SEMINARIO
     SIMULACION DE SISTEMAS SOLIDOS
     ESTADO SOLIDO
     FISICA DE SUPERFICIES
     PREPARACION Y CARACTERIZACION  DE NANOPARTICULAS
     TECNICAS EXPERIM. EN NANOCIENCIAS Y NANOTECNOLOGIA
     ANALISIS DE SEÑALES BIOMEDICAS I
     ANALISIS DE SEÑALES BIOMEDICAS II

     METODOS NUMERICOS ESPECIALES
     FISICA MODERNA
     TEORIA ELECTROMAGNETICA
     PROCESOS ESTOCASTICOS I
     METODOS MATEMATICOS DE LA FISICA I
     INVESTIGACION DE OPERACIONES
     FISICA DE LOS SISTEMAS DE BAJA DIMENSIONALIDAD
     CONTROL OPTIMO
     TOPICOS DE FOTONICA
     CUMULOS METALICOS
     INTRODUCCION A LA TEORIA DE CONTROL AUTOMATICO
     CRISTALES SUPREMOLECULARES
     METODOS DE SINTESIS DE NANOESTRUCTURAS
     SINTESIS Y CARACTERIZACION DE PELICULAS DELGADAS
     METODOS MATEMATICOS DE CONTROL
     SISTEMAS DINAMICOS NO LINEALES I
     OPTICA FISICA
     FISICA CUANTICA
     FISICA DE PLASMAS
     INTRODUCCION A LA FUSION
     FISICA DE CELDAS SOLARES
     INTRODUCCION A LA NANOTECNOLOGIA
     TOPICOS AVANZADOS DE FOTONICA
     METODOS APLICADOS EN MICROSCOPIA ATOMICA
     QUIMICA DE MATERIALES
     ESPECTROSCOPIAS
     RADIOMETRIA
     */
    self.arrayPlanCompleto = [[NSMutableArray alloc] initWithArray:array];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.tablaPlanEstudioTiempoCompleto) {
        return self.arrayPlanCompleto.count;
    } else if(tableView == self.tablaPlanEstudioTiempoParcial) {
        return self.arrayPlanParcial.count;
    } else {
        return self.arrayOptativas.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    NSDictionary *dicc;
    
    if(tableView == self.tablaPlanEstudioTiempoCompleto) {
        dicc = [self.arrayPlanCompleto objectAtIndex:indexPath.row];
        if([[dicc objectForKey:@"tipo"] isEqualToString:@"1"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellPlanMaestria"];
        } else {
            
        }
    } else if(tableView == self.tablaPlanEstudioTiempoParcial) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellPlanMaestria"];
    } else {
        
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
