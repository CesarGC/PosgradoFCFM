//
//  MapaPosgradoViewController.m
//  PosgradoApp
//
//  Created by Servicio Social on 24/01/17.
//  Copyright © 2017 Servicio Social. All rights reserved.
//

#import "MapaPosgradoViewController.h"
#import <MapKit/MapKit.h>
#import "MapPinAnnotation.h"

@interface MapaPosgradoViewController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapaPosgrado;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation MapaPosgradoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 1000.0;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // Request Authorization
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    // Start Updating Location only when user authorized us
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)
    {
        [_locationManager startUpdatingLocation];
    }
    // We make our initial region, this will be used later
    // Instantiate our MapView - YIS!
    self.mapaPosgrado.showsUserLocation = YES;
    self.mapaPosgrado.delegate = self;
    
    // Set the initial zoom and size of the map that we can see in our screen
    MKUserLocation *userLocation = self.mapaPosgrado.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance (userLocation.location.coordinate, 25.7493469, -100.28689730000002);
    
    MKCoordinateRegion adjustedRegion = [self.mapaPosgrado regionThatFits:region];
    if(adjustedRegion.center.longitude == -180.00000000){
        NSLog(@"Invalid region!");
    } else {
        [self.mapaPosgrado setRegion:adjustedRegion animated:YES];
    }
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(25.7261455, -100.31501679999997);
    
    MapPinAnnotation* pinAnnotation =
    [[MapPinAnnotation alloc] initWithCoordinates:coordinate
                                        placeName:@"Posgrado FCFM"
                                      description:@"Camino, Ciudad Universitaria, San Nicolás de los Garza, N.L."];
    
    [self.mapaPosgrado addAnnotation:pinAnnotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
        if (userLocation.location) {
            [mapView setCenterCoordinate:userLocation.location.coordinate];
        }
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    MKUserLocation *userLocation = self.mapaPosgrado.userLocation;
    NSLog(@"%f %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
}

@end
