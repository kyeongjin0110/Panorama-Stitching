# Panorama-Stitching
#### The goal of this assignment consists of combining two or more images into a panoramic view.

## Main description

The students are expected to implement the DLT (using image coordinates, learned in class), the normalized DLT and the Gold Standard algorithm (in this case they can choose either the Sampson error and/or the Gold Standard error1) to compute the homographies. Corresponding points can be indicated manually in the images (using ginput from Matlab). Students should both consider the minimal case with 4 points and a case with 10 or more corresponding points.

Students are encouraged to implement the solution for this assignment using Matlab. Matlab provides all the necessary function to read, display and manipulate images (try help images and also have a look at the ipextform demo), as well as algorithms for linear least-squares (use svd) and non-linear least squares (lsqnonlin). Matlab also allows obtaining easily coordinates of clicked points (ginput).

Note that you need to spend some time learning the details from the Multiview Geometry book, especially chapter 4 and 8.4.3.

## Requirements

- MATLAB

## Testing

```bash
run main.m
