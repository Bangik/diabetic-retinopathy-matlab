img0 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/0/00cc2b75cddd.png');
img1 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/1/38e0e28d35d3.png');
img2 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/2/3f5b4c2948e8.png');
img3 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/3/8688f3d0fcaf.png');
img4 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/4/613028ede6a0.png');

green0 = img0(:,:,2);
green1 = img1(:,:,2);
green2 = img2(:,:,2);
green3 = img3(:,:,2);
green4 = img4(:,:,2);

negative0 = imcomplement(green0);
negative1 = imcomplement(green1);
negative2 = imcomplement(green2);
negative3 = imcomplement(green3);
negative4 = imcomplement(green4);

clahe0 = adapthisteq(negative0);
clahe1 = adapthisteq(negative1);
clahe2 = adapthisteq(negative2);
clahe3 = adapthisteq(negative3);
clahe4 = adapthisteq(negative4);

se = strel('ball',8,8);

opening0 = imopen(clahe0,se);
opening1 = imopen(clahe1,se);
opening2 = imopen(clahe2,se);
opening3 = imopen(clahe3,se);
opening4 = imopen(clahe4,se);

rmdisk0 = clahe0 - opening0;
rmdisk1 = clahe1 - opening1;
rmdisk2 = clahe2 - opening2;
rmdisk3 = clahe3 - opening3;
rmdisk4 = clahe4 - opening4;

medfilt0 = medfilt2(rmdisk0);
medfilt1 = medfilt2(rmdisk1);
medfilt2 = medfilt2(rmdisk2);
medfilt3 = medfilt2(rmdisk3);
medfilt4 = medfilt2(rmdisk4);

background0 = imopen(rmdisk0,strel('disk',15));
background1 = imopen(rmdisk1,strel('disk',15));
background2 = imopen(rmdisk2,strel('disk',15));
background3 = imopen(rmdisk3,strel('disk',15));
background4 = imopen(rmdisk4,strel('disk',15));

I0 = medfilt0 - background0;
I1 = medfilt1 - background1;
I2 = medfilt2 - background2;
I3 = medfilt3 - background3;
I4 = medfilt4 - background4;

imadj0 = imadjust(I0);
imadj1 = imadjust(I1);
imadj2 = imadjust(I2);
imadj3 = imadjust(I3);
imadj4 = imadjust(I4);

subplot(2,3,1),imshow(imadj0),title('No DR');
subplot(2,3,2),imshow(imadj1),title('Mild');
subplot(2,3,3),imshow(imadj2),title('Moderate');
subplot(2,3,4),imshow(imadj3),title('Severe');
subplot(2,3,5),imshow(imadj4),title('Proliferative DR');