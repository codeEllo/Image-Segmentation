
% CONVERT TO NEGATIVE IMAGE
% reading the RGB file into the Matlab environment
skI = imread("image-slice085.jpg");   
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
        if neg(y,x) >= 10 && neg(y,x) <= 120
            neg2(y,x) = 1;
        end
    end
end
figure; imshow (neg2), title ('double thresholding method');

  
% OPENING METHOD
se = strel('disk', 7);
afterOpening = imopen(neg2,se);
figure;
imshow(afterOpening,[]), title('Opening technique');

  
% CLOSING METHOD
se2 = strel('disk',5);
closeBW =  imclose(afterOpening,se2);
figure, imshow(closeBW),title('FINAL RESULT CLOSE technique');

 
imwrite (closeBW, '#.jpg');


