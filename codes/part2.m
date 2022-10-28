clear all

picture = imread('house.jpg');
gray_pic = rgb2gray(picture);

sharpen = [0, -1, 0; -1, 5, -1; 0, -1, 0];
pic1 = conv2(sharpen, double(gray_pic));
figure(1)
imshow(uint8(pic1));
title('Shrpen Kernel');

blur = [0.0625, 0.125, 0.0625;0.125, 0.25, 0.125;0.0625, 0.125, 0.0625];
pic2 = conv2(blur, double(gray_pic));
figure(2)
imshow(uint8(pic2));
title('Blur Kernel');


outline = [-1, -1, -1;-1, 8, -1;-1, -1, -1];
pic3 = conv2(outline, double(gray_pic));
figure(3)
imshow(uint8(pic3));
title('Outline Kernel');


gauss = [0.0113, 0.0838, 0.0113;0.0838, 0.6193, 0.0838;0.0113, 0.1111, 0.0113];
pic4 = conv2(gauss, double(gray_pic));
figure(4)
imshow(uint8(pic4));
title('Gauss Kernel');


avg_moving = 0.1111*ones(3,3);
pic5 = conv2(avg_moving, double(gray_pic));
figure(5)
imshow(uint8(pic5));
title('Moving Average Kernel');


lineH = [-1 , -1, -1;2 , 2, 2;-1, -1, -1];
pic6 = conv2(lineH, double(gray_pic));
figure(6)
imshow(uint8(pic6));
title('Horizental Line Kernel');


lineV = [-1 , 2, -1;-1, 2, -1;-1 , 2, -1];
pic7 = conv2(lineV, double(gray_pic));
figure(7)
imshow(uint8(pic7));
title('Vertical Line Kernel');


identity = [0, 0, 0;0, 1, 0;0, 0, 0];
pic8 = conv2(identity, double(gray_pic));
figure(8)
imshow(uint8(pic8));
title('Identity Kernel');


%_________________________________________________%


picture = imread('kobe.jpeg');

small_pic = imresize(picture, 0.2);
figure(12);
imshow(small_pic);
resized_pic = imresize(small_pic, 5, 'nearest');

figure(9)
imshow(resized_pic);
title('Resized Picture');

improved_pic1 = conv2(gauss, double(rgb2gray(resized_pic)));
improved_pic2 = conv2(avg_moving, double(rgb2gray(resized_pic)));

figure(10)
imshow(uint8(improved_pic1));
title('Improved with gaussian kernel');
figure(11)
imshow(uint8(improved_pic2));
title('Improved with moving average kernel');


