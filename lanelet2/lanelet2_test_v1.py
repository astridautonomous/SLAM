#!/usr/bin/env python
import cv2 as cv
import numpy as np
import lanelet2

filename = "/home/tezcan/testdrive_carla/19.05.24_TEST/18.05_TEST_TIER4.osm" # ADD YOUT ".OSM" FILE
latitude = -1.0
longitude = -1.0
origin = lanelet2.io.Origin(latitude, longitude)
projector = lanelet2.projection.UtmProjector(origin)
traffic_rules = lanelet2.traffic_rules.create(lanelet2.traffic_rules.Locations.Germany, lanelet2.traffic_rules.Participants.Vehicle)

map = lanelet2.io.load(filename, projector)

lanelet_boundaries = []
stopline_boudaries = [] 

# DEFINING TEST FUNCTION
def brake_contol(rad):
    print(rad)

print("QUantitiy of Points:", len(map.pointLayer))
print("QUantitiy of Linestrings:", len(map.lineStringLayer))
print("QUantitiy of Lanele:", len(map.laneletLayer))
print("QUantitiy of Areas:", len(map.areaLayer))
print("QUantitiy of Polygons:", len(map.polygonLayer))
print("QUantitiy of Regulatory Elements:", len(map.regulatoryElementLayer))

#print("Points; ")
#for point in map.pointLayer:
#    print(f"Point ID: {point.id}, Coordinates: ({point.x}, {point.y})")

# STOP LINE DETECTION 
for linestring in map.lineStringLayer:
    if ((linestring.attributes['type']) == "stop_line"):
        print(len(map.lineStringLayer))
        coords = [(point.x, point.y) for point in linestring]
        print(f"Stop Line ID: {linestring.id}, Coordinates: {coords}")
        brake_contol(10)

# TRAFFIC SIGN DETECTION
print("\nLinestrings; ")
for linestring in map.lineStringLayer:
    if (linestring.attributes['type']) == "traffic_sign":
        print(len(map.lineStringLayer))
        coords = [(point.x, point.y) for point in linestring]
        brake_contol(10)
    
    # NEXT 5 UNIT COORDINATES DETECTION
    if 'type' in linestring.attributes and linestring.attributes['type'] == 'stop_line':
        coords = [(point.x, point.y) for point in linestring]
        # print(f"Stop Line ID: {linestring.id}, Coordinates: {coords}")
        stopline_index = list(map.lineStringLayer).index(linestring)

        for i in range(stopline_index, stopline_index + 5):
            if 0<= i < len(map.lineStringLayer):
                next_linestring = map.lineStringLayer[i]
                next_coords = [(point.x, point.y) for point in next_linestring]
                stopline_boudaries.extend(next_coords)

            else:
                print(f"Index {i} is out of bounds.")

print(f"Next 5 Coordinates after Stop Line ID {linestring.id}: {stopline_boudaries[:5]}")
    

# lanelet boundaries
#print("\nLanelets:")
#for lanelet in map.laneletLayer:
#    left_bound = [(pt.x, pt.y) for pt in lanelet.leftBound]
#    right_bound = [(pt.x, pt.y) for pt in lanelet.rightBound]
#    print(f"Lanelet ID: {lanelet.id}")
#    print(f"  Left Bound: {left_bound}")
#    print(f"  Right Bound: {right_bound}")
#    lanelet_boundaries.append((left_bound, right_bound))

#print(dir(lanelet2.core))

###########################################################################
# OpenCV transformation
###########################################################################
#image_w = 200
#image_h = 200
#resolution= 1.0
#
#image= np.zeros((image_h, image_w, 3), dtype=np.uint8)
#
#def transform_coordinates (x,y):
#    x_img= int((x+image_w/2)*resolution)
#    y_img= int((y+image_h/2)*resolution)
#    return x_img, y_img
#
#for left_bound, right_bound in lanelet_boundaries:
#    for i in range(len(left_bound)-1):
#        pt1 = transform_coordinates(*left_bound[i])
#        pt2 = transform_coordinates(*left_bound[i + 1])
#        cv.line(image, pt1, pt2, (0, 255, 0), 1)  #YESIL
#
#    for i in range(len(right_bound)-1):
#        pt1 = transform_coordinates(*right_bound[i])
#        pt2 = transform_coordinates(*right_bound[i + 1])
#        cv.line(image, pt1, pt2, (0, 0, 255), 1)  # KIZIL
#
#cv.imshow("Astrid_LaneletMap",image)
#cv.waitKey()
#cv.destroyAllWindows()
###########################################################################