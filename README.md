:taxi: MeineFahrt :red_car:
==========

A small app to show vehicles position both in a list and on a map.

Build
-----

Builded using XCode 10.1, Swift 4.2 and Objective-C.

It is a mixed-language project. The base and the list part were written in Swift.
The map part was written in Objective-C.

Notes
-----

- Had some problems to build the map viewmodel in objective-c mainly because of enums and generics that I would need to change in my PoiService and
  in the DynamicValue. To finish the app in time I choose to make a MapViewModel in swift so it acts as a wrapper.

- Kind of obvious but the yellow car represents the TAXI fleetType from the POI list and red car is the POOLING type.


Changelog
---------

- 0.0.1 First commit with default structure
- 0.0.2 Added Network layer
- 0.0.3 Basic list view to show acquired data
