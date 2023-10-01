I = imread('road.png');

imshow(I);

U = ginput(4)
X = [0, 0; 500, 0; 500 500; 0 500];

t = maketform('projective', U, X);

II = imtransform(I, t, 'bicubic');
figure;
imshow(II);