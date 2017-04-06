//
//  MaestriaPlanEstudiosViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 07/02/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MaestriaPlanEstudiosViewController.h"
#import "MaestriaPlanCompletoTableViewCell.h"
#import "MaestraPlanSemestreTableViewCell.h"
#import "MaestriaPDFViewController.h"

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
    [self.tablaPlanEstudioTiempoCompleto registerNib:[UINib nibWithNibName:@"MaestraPlanSemestreTableViewCell" bundle:nil] forCellReuseIdentifier:@"maestiraSemestre"];
    
    [self.tablaPlanEstudioTiempoParcial registerNib:[UINib nibWithNibName:@"MaestriaPlanCompletoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellPlanMaestria"];
    [self.tablaPlanEstudioTiempoParcial registerNib:[UINib nibWithNibName:@"MaestraPlanSemestreTableViewCell" bundle:nil] forCellReuseIdentifier:@"maestiraSemestre"];
    
    [self.tablaOptativas registerNib:[UINib nibWithNibName:@"MaestriaPlanCompletoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellPlanMaestria"];
    [self.tablaOptativas registerNib:[UINib nibWithNibName:@"MaestraPlanSemestreTableViewCell" bundle:nil] forCellReuseIdentifier:@"maestiraSemestre"];
    
    self.tablaOptativas.rowHeight = UITableViewAutomaticDimension;
    self.tablaOptativas.estimatedRowHeight = 140;
    self.tablaPlanEstudioTiempoParcial.rowHeight = UITableViewAutomaticDimension;
    self.tablaPlanEstudioTiempoParcial.estimatedRowHeight = 140;
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
    
    [self llenarArrayParcial];
    [self.tablaPlanEstudioTiempoParcial reloadData];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //This code will run in the main thread:
        CGRect frame = self.tablaPlanEstudioTiempoParcial.frame;
        frame.size.height = self.tablaPlanEstudioTiempoParcial.contentSize.height;
        self.constraintHeightParcial.constant = frame.size.height;
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
    self.constraintHeightParcial.constant = self.tablaPlanEstudioTiempoParcial.contentSize.height;
    self.constraintHeightOptativas.constant = self.tablaOptativas.contentSize.height;
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

    self.arrayPlanParcial = [[NSMutableArray alloc] initWithArray:array];
}

- (void)llenarArregloOptativas {
    NSArray *array = @[
    @{@"materia":@"ELECTRODINAMICA CLASICA I",@"tipo":@"3"},
    @{@"materia":@"MECANICA CLASICA",@"tipo":@"3"},
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
    } else if(tableView == self.tablaPlanEstudioTiempoParcial) {
        return self.arrayPlanParcial.count;
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
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellPlanMaestria"];
            [(MaestriaPlanCompletoTableViewCell *)cell actualizaInformacion:[self.arrayPlanCompleto objectAtIndex:indexPath.row]];
        } else {
            cell = [tableView dequeueReusableCellWithIdentifier:@"maestiraSemestre"];
            [(MaestraPlanSemestreTableViewCell *)cell actualizaInfoSemestre:[self.arrayPlanCompleto objectAtIndex:indexPath.row]];
        }
    } else if(tableView == self.tablaPlanEstudioTiempoParcial) {
        dicc = [self.arrayPlanParcial objectAtIndex:indexPath.row];
        if([[dicc objectForKey:@"tipo"] isEqualToString:@"1"]) {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellPlanMaestria"];
            [(MaestriaPlanCompletoTableViewCell *)cell actualizaInformacion:[self.arrayPlanParcial objectAtIndex:indexPath.row]];
        } else {
            cell = [tableView dequeueReusableCellWithIdentifier:@"maestiraSemestre"];
            [(MaestraPlanSemestreTableViewCell *)cell actualizaInfoSemestre:[self.arrayPlanParcial objectAtIndex:indexPath.row]];
        }
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"maestiraSemestre"];
        [(MaestraPlanSemestreTableViewCell *)cell actualizaInfoSemestre:[self.arrayOptativas objectAtIndex:indexPath.row]];
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
    [self.delegado presentarPDFController:controller];
}


@end
