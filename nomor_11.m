img0 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/0/00cc2b75cddd.png');
img1 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/1/38e0e28d35d3.png');
img2 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/2/3f5b4c2948e8.png');
img3 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/3/8688f3d0fcaf.png');
img4 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/4/613028ede6a0.png');

img0 = preprocessingBloodVessel(img0);
img1 = preprocessingBloodVessel(img1);
img2 = preprocessingBloodVessel(img2);
img3 = preprocessingBloodVessel(img3);
img4 = preprocessingBloodVessel(img4);

img0 = bloodVessel(img0);
img1 = bloodVessel(img1);
img2 = bloodVessel(img2);
img3 = bloodVessel(img3);
img4 = bloodVessel(img4);

subplot(2,3,1),imshow(img0),title('No DR');
subplot(2,3,2),imshow(img1),title('Mild');
subplot(2,3,3),imshow(img2),title('Moderate');
subplot(2,3,4),imshow(img3),title('Severe');
subplot(2,3,5),imshow(img4),title('Proliferative DR');

function adapthis = preprocessingBloodVessel(img)
  resized = imresize(img,[500 500]);
  green = resized(:,:,2);
  adapthis = adapthisteq(green,'clipLimit',0.01,'Distribution','rayleigh');
end

function dilate = edgeDetection(img)
  medfilt = medfilt2(img);
  gaussi = imgaussfilt(medfilt);
  morphclose = imclose(gaussi,strel('disk',5));
  canny = edge(morphclose,'canny');
  eliminate = bwareaopen(canny, 100);
  dilate = imdilate(eliminate,strel('disk',5));
end

function dilate = rmOpticDisk(img)
  medfilt = medfilt2(img);
  clahe = adapthisteq(medfilt,'clipLimit',0.01,'Distribution','rayleigh');
  gaussi = imgaussfilt(clahe);
  morphclose = imclose(gaussi,strel('disk',5));
  canny = edge(morphclose,'canny');
  eliminate = bwareaopen(canny, 100);
  dilate = imdilate(eliminate,strel('disk',5));
end

function frangi = bloodVessel(img)
  erode = imerode(img,strel('disk',5));
  morphrecon = imreconstruct(erode,img);
  clahe = adapthisteq(morphrecon,'clipLimit',0.01,'Distribution','rayleigh');
  medfilt = medfilt2(clahe);
  bottomhat = imbothat(medfilt,strel('disk',5));
  frangi = frangiFilter2D(bottomhat);
end