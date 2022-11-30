img0 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/0/00cc2b75cddd.png');
img1 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/1/38e0e28d35d3.png');
img2 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/2/3f5b4c2948e8.png');
img3 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/3/8688f3d0fcaf.png');
img4 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/4/613028ede6a0.png');

img0 = preprocessing(img0);
img1 = preprocessing(img1);
img2 = preprocessing(img2);
img3 = preprocessing(img3);
img4 = preprocessing(img4);

subplot(2,3,1),imshow(img0),title('No DR');
subplot(2,3,2),imshow(img1),title('Mild');
subplot(2,3,3),imshow(img2),title('Moderate');
subplot(2,3,4),imshow(img3),title('Severe');
subplot(2,3,5),imshow(img4),title('Proliferative DR');

function closing = preprocessing(img)
  gray = rgb2gray(img);
  grayadjust = imadjust(gray);
  % green = img(:,:,2);
  closing = imclose(grayadjust,strel('ball',10,10));
end