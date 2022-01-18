
  
% CONVERT TO NEGATIVE IMAGE
% reading the RGB file into the Matlab environment
skI = imread("image-slice084.jpg");   
subplot(1, 2, 1),
  
% displaying the RGB image
imshow(skI);
title("Original image");
  
% levels of the 8-bit image
L = 2 ^ 8;    
  
% finding the negative                   
neg = (L - 1) - skI;
subplot(1, 2, 2),
  
% displaying the negative image
imshow(neg);
figure; title("NEGATIVE IMAGE")

  
% DOUBLE THRESHOLDING METHOD
[m,n] = size(neg);
neg2 =  zeros(size(neg));

for y = 1:m
    for x = 1:n
        if neg(y,x) >= 90 && neg(y,x) <= 120
            neg2(y,x) = 1;
        end
    end
end
figure; imshow (neg2), title ('double thresholding method');

  
% DILATED METHOD
se1 = strel('disk',1);
i3 = imdilate (neg2,se1);
figure;
imshow(i3), title('dilated Image');

  
% OPENING METHOD
se = strel('disk', 5);
afterOpening = imopen(i3,se);
figure;
imshow(afterOpening,[]), title('Opening technique');

  
% CLOSING METHOD
se2 = strel('disk',3);
closeBW = imclose(afterOpening,se2);
figure, imshow(closeBW)


imwrite (closeBW, '#.jpg');


    




