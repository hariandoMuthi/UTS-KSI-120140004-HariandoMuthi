clc; clear; close all; warning off all;

%120140004 Hariando Muthi KSI RD

%membaca citra background dan foreground
Background = imread("background.jpg");
Foreground = imread('foreground.jpg');

%menampilkan data 
figure, imshow(Background);
figure, imshow(Foreground);

%melakukan konfersi citra RGB menjadi citra grayscale

Background_gray = rgb2gray(Background);
Foreground_gray = rgb2gray(Foreground);

%menampilkan data hasil
figure, imshow(Background_gray);
figure, imshow(Foreground_gray);

%kemudian citra Background dikurang dengan Foreground untuk mendapatkan
%objek

%melakukan operasi pengurangan (substraksi) pada citra Grayscale
Subtraction = imsubtract(Foreground_gray, Background_gray);
figure, imshow(Subtraction);

%mengkonversi citra grayscale menjadi citra binner
Subtraction = imbinarize(Subtraction);
figure, imshow(Subtraction);

%melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
bw = imfill(Subtraction, 'holes');
figure, imshow(bw);

%menghilangkan noise
% jika ada objek lebih dari 5000 maka dihilangkan
bw = bwareaopen(bw, 5000);
figure, imshow(bw);

%menampilkan bounding box hasil deteksi objek
s = regionprops(bw, 'BoundingBox');
bbox = cat(1,s.BoundingBox);

RGB = insertShape(Foreground,'Rectangle', bbox, 'Linewidth', 4);
figure, imshow(RGB);











































