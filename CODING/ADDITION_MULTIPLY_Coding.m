
i1 = imread("flair-image-slice055.jpg");
i2 = imread("T1-image-slice055.jpg");
i3 = imread("T1CE-image-slice055.jpg");
i4 = imread("T2-image-slice055.jpg");


I3 = uint16(i3);
I4 = uint16(i4);

J = imadd(i1,i2);
figure, imshow(J), title('flair + T1 = Result1')
J1 = uint16(J);

M = immultiply(I3,I4);
figure, imshow(M), title('T1CE x T2 = Result2')

O = immultiply (J1,M);

figure, imshow(O), title('Result1 x Result2')
%imwrite( O, 'image-slice055.png');