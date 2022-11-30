img0 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/0/00cc2b75cddd.png');
img1 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/1/38e0e28d35d3.png');
img2 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/2/3f5b4c2948e8.png');
img3 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/3/8688f3d0fcaf.png');
img4 = imread('E:/Pawang Code/Diabetic Retinopathy/dataset/4/613028ede6a0.png');

imgprep0 = preprocessing(img0);
imgprep1 = preprocessing(img1);
imgprep2 = preprocessing(img2);
imgprep3 = preprocessing(img3);
imgprep4 = preprocessing(img4);

subplot(3,4,1),imshow(imgprep0),title('No DR');
subplot(3,4,2),imshow(img0),title('No DR');
subplot(3,4,3),imshow(imgprep1),title('Mild');
subplot(3,4,4),imshow(img1),title('Mild');
subplot(3,4,5),imshow(imgprep2),title('Moderate');
subplot(3,4,6),imshow(img2),title('Moderate');
subplot(3,4,7),imshow(imgprep3),title('Severe');
subplot(3,4,8),imshow(img3),title('Severe');
subplot(3,4,9),imshow(imgprep4),title('Proliferative DR');
subplot(3,4,10),imshow(img4),title('Proliferative DR');

function adapthis = preprocessing(img)
  green = img(:,:,2);
  adapthis = adapthisteq(green);
end