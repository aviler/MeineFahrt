//
//  MapViewController.m
//  MeineFahrt
//
//  Created by Oliver M Batista on 20/04/19.
//  Copyright © 2019 Oliver M Batista. All rights reserved.
//

#import "MapViewController.h"
#import "MeineFahrt-Swift.h"
#import "PoiAnnotation.h"

#define REGION_IN_METERS 100
#define HAMBURG_LATITUDE 53.551086
#define HAMBURG_LONGITUDE 9.993682


@interface MapViewController () {
  NSMutableArray<PoiAnnotation *> *_annotations;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (instancetype)initWithViewModel:(MapViewModel *)viewmodel {
  self = [super init];
  if (self) {
    _viewmodel = viewmodel;
    _annotations = [NSMutableArray new];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  [_mapView setDelegate:self];
  [_mapView setZoomEnabled:NO];
  
  CLLocationCoordinate2D startLocation;
  startLocation.latitude = HAMBURG_LATITUDE;
  startLocation.longitude = HAMBURG_LONGITUDE;
  MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(startLocation, REGION_IN_METERS, REGION_IN_METERS);
  [_mapView setRegion:viewRegion animated:YES];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
  
  MKMapRect mRect = self.mapView.visibleMapRect;
  MKMapPoint neMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), mRect.origin.y);
  MKMapPoint swMapPoint = MKMapPointMake(mRect.origin.x, MKMapRectGetMaxY(mRect));
  CLLocationCoordinate2D ne = MKCoordinateForMapPoint(neMapPoint);
  CLLocationCoordinate2D sw = MKCoordinateForMapPoint(swMapPoint);
  
  [_viewmodel fetchVehiclesAtP1Lat:ne.latitude p1Lon:ne.longitude p2Lat:sw.latitude p2Lon:sw.longitude
                        completion:^(NSArray<Poi *> * _Nonnull pois) {
                          
                          dispatch_async(dispatch_get_main_queue(), ^{
                            
                            [self.mapView removeAnnotations:self->_annotations];
                            [self->_annotations removeAllObjects];
                            for (Poi *poi in pois) {
                              PoiAnnotation *ann = [[PoiAnnotation alloc] initWithPoi:poi];
                              [self->_annotations addObject:ann];
                            }
                            [self.mapView addAnnotations:self->_annotations];
                            
                          });
                        }];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  
  if([annotation isKindOfClass:[PoiAnnotation class]]) {
    PoiAnnotation *custom = (PoiAnnotation *) annotation;
    
    MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"customAnnotation"];
    
    if(annotationView == nil)
      annotationView = custom.annotationView;
    else
      annotationView.annotation = annotation;
    
    return annotationView;
  }else{
    return nil;
  }
}

@end
