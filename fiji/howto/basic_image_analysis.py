#!/usr/bin/env python

from skimage import io, filter, measure
import mahotas
from scipy import ndimage
import numpy as np

#this script will perform some simple image processing for Super Resolution Microscopy Images
# (1) read in the image (tif)
# (2) separate the colors - 'magenta' and 'green'
# (3) threshold the image - produces image masks
# (4) detect clusters
# (5) measure clusters
# (6) output measured clusters data into .csv file (can be opened as a table in excel)
# (7) a little bit more advanced - colocalization analysis

def get_perim_pixels(image):
    #surround image with 1x1 blank rectangle so entire perimeter will be found
    new_row = np.zeros(len(image[0]))
    image = np.insert(image, 0, new_row, axis=0)
    image = np.insert(image, len(image), new_row, axis=0)
    image = np.insert(image, 0, 0, axis=1)
    image = np.insert(image, len(image[0]), 0, axis=1)
            
    #find perimeter of the sliced image
    image_perim = mahotas.labeled.bwperim(image)

    #remove fake border
    image_perim = np.delete(image_perim, 0, axis=0)
    image_perim = np.delete(image_perim, len(image_perim)-1, axis=0)
    image_perim = np.delete(image_perim, 0, axis=1)
    image_perim = np.delete(image_perim, len(image_perim[0])-1, axis=1)
    
    return image_perim
    
pixels_to_nm = 20 # (1 px = 20 nm for reconstructed images)
image_file = 'image_for_basic_image_analysis.tif'

# (1) read in the image file - use scikit-image io.imread function
image_rgb_array = io.imread(image_file)

# (2) separate the colors
print 'Image array shape: ' + str(image_rgb_array.shape)
print 'Image array dtype: ' + str(image_rgb_array.dtype)
red_image = image_rgb_array[:,:,0] # take the red color only (value is repeated in the blue to map to magenta)
green_image = image_rgb_array[:,:,1] #take the green color only

#save the red and green images as individual greayscale images
io.imsave('image_red.tif', red_image)
io.imsave('image_green.tif', green_image)

# (3) threshold the image, global methods return the threshold value:

#Otsu's method, as in http://scikit-image.org/docs/dev/auto_examples/plot_otsu.html
th = filter.threshold_otsu(red_image)
print 'Otsu: ' + str(th)

#Ridler-Calvard method, this is default ImageJ 'threshold': http://fiji.sc/Auto_Threshold#Default
th = mahotas.rc(red_image)
print 'RC: ' + str(th)

#also, local thresholding available which directly returns the masked array, e.g. filter.threshold_adaptive(...)

#mask is all values greater than threshold
red_mask = red_image > th

th  = mahotas.rc(green_image)
green_mask = green_image > th

#save red and green mask - white out True values and cast the data type
io.imsave('image_red_mask.tif', 255*red_mask.astype('uint8')) #, plugin='freeimage')
io.imsave('image_green_mask.tif', 255*green_mask.astype('uint8')) #, plugin='freeimage')

# (4) detect the clusters - cluster regions are labeled by integers, 1 to num_labels

#use 8-connectivity, diagonal pixels will be included as part of a structure
#this is ImageJ default but we have to specify this for Python, or 4-connectivity will be used
s = [[1,1,1],[1,1,1],[1,1,1]]

red_labeled_clusters, num_labels = ndimage.label(red_mask, structure=s)
green_labeled_clusters, num_labels = ndimage.label(green_mask, structure=s)

# (5) measure cluster properties
propList = ['Area',
            'Image', #sliced binary region image same size as bounding box
            'BoundingBox',
            'MajorAxisLength',
            'MinorAxisLength',
            'Perimeter',
            'MinIntensity',
            'MeanIntensity',
            'MaxIntensity']

#red_props = measure.regionprops(red_labeled_clusters, propList, red_image) #send in original image for Intensity measurements
#green_props = measure.regionprops(green_labeled_clusters, propList, green_image) #send in original image for Intensity measurements
# *NOTE: new version of scikit-image (0.10x) does not use propList parameter since it finds all properties dynamically
red_props = measure.regionprops(red_labeled_clusters, red_image) #send in original image for Intensity measurements
green_props = measure.regionprops(green_labeled_clusters, green_image) #send in original image for Intensity measurements

# create image with an outline of the labeled clusters (red and green), with overlap area in white
outline_image = np.zeros((len(red_image), len(red_image[0]), 3), dtype='uint8')

# (6) output data to file

#remove BBox and Image, we are not printing those to the csv file
propList.remove('Image')
propList.remove('BoundingBox')

output_file = open('image_measurements-RED.csv', 'w')
output_file.write(',' + ",".join(propList) + '\n') #join strings in array by commas, leave first cell blank
for cluster_props in red_props:
    #output cluster properties to the excel file
    output_file.write(str(cluster_props['Label']))
    for i,prop in enumerate(propList):
        if(prop == 'Area'): to_print = cluster_props[prop]*pixels_to_nm**2
        elif(prop.find('Intensity') < 0): to_print = cluster_props[prop]*pixels_to_nm
        else: to_print = cluster_props[prop]
        output_file.write(',' + str(to_print))
    output_file.write('\n')
    
    #output the outline of the cluster to the outline image
    #find the perimeter of the 'slice', then place it back into the original image coordinates
    image_perim = get_perim_pixels(cluster_props['Image'])
    r1,c1,r2,c2 = cluster_props['BoundingBox']
    for i,val1 in enumerate(image_perim):
        for j,val2 in enumerate(val1):
            if(val2):
                outline_image[i + r1][j + c1] = [255,0,0] #red outline
    
# same for green
output_file = open('image_measurements-GREEN.csv', 'w')
output_file.write(',' + ",".join(propList) + '\n') 
for cluster_props in green_props:
    output_file.write(str(cluster_props['Label']))
    for i,prop in enumerate(propList):
        if(prop == 'Area'): to_print = cluster_props[prop]*pixels_to_nm**2
        elif(prop.find('Intensity') < 0): to_print = cluster_props[prop]*pixels_to_nm
        else: to_print = cluster_props[prop]
        output_file.write(',' + str(to_print))
    output_file.write('\n')
    
    image_perim = get_perim_pixels(cluster_props['Image'])
    r1,c1,r2,c2 = cluster_props['BoundingBox']
    for i,val1 in enumerate(image_perim):
        for j,val2 in enumerate(val1):
            if(val2):
                outline_image[i + r1][j + c1] = [0,255,0] #green outline
      
# (7) colocalization
# for each red cluster, find any colocalization with green cluster(s)
# (this could be done for green vs. red as well)

# open new file
output_file = open('image_measurements-GREEN-Overlap.csv', 'w')
output_file.write(',Overlap_Labels,OverlapAreas,TotalOverlapArea\n')

# need the coordinates of the red clusters, then we can find where they intersect with any green
green_props = measure.regionprops(green_labeled_clusters, ['Coordinates'])

for cluster_props in green_props:
    coords = cluster_props['Coordinates']
    total_area = 0 #stores total overlap area for this cluster
    overlap = {} #stores the overlap area, indexed by green label
    for c in coords:
        red_label = red_labeled_clusters[c[0],c[1]]
        if(red_label > 0): #if there is a red cluster overlapping here
            if red_label in overlap:
                overlap[red_label] += 1
            else: overlap[red_label] = 1
            total_area += 1
            
            #white out this pixel in our example image
            if(max(outline_image[c[0]][c[1]]) == 0): #still want to show outline as Red/Gr (although it is part of the overlap)
                outline_image[c[0]][c[1]] = [255,255,255]
            
    output_file.write(str(cluster_props['Label']))
    red_labels = overlap.keys()
    area_list = []
    label_list = []
    for label in red_labels:
        label_list.append(str(label))
        area_list.append(str(overlap[label]*pixels_to_nm**2))
        
    output_file.write(',' + ";".join(label_list) + ',' + ";".join(area_list) + ',' + str(total_area*pixels_to_nm**2) + '\n')
    
#save outline image:
io.imsave('outline_image.tif', outline_image)

#double check overlap
red_green_mask = np.logical_and(red_mask, green_mask)
total_overlap_area = np.count_nonzero(red_green_mask)*pixels_to_nm**2
print 'Total Overlap Area of images: ' + str(total_overlap_area) #should be same as sum of TotalOverlapArea column in csv file
    
    
    
















