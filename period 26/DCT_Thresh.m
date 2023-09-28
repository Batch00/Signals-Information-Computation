function [ThreshCoefs] = DCT_Thresh(Coefs,thresh);
%
% Returns ThreshCoefs which has zeros in all entries of Coefs that have
% absolute value less than thresh.
%
% Displays inverse DCT image of Coefs and ThreshCoefs.  Assumes 8 bit
% grayscale images

orig = idct2(Coefs);

ThreshCoefs = Coefs;
ThreshCoefs(abs(Coefs) < thresh) = 0;
thresh = idct2(ThreshCoefs);

figure
subplot(1,2,1)
imagesc(orig,[0,255])
colormap(gray)
set(gca,'Xtick',[])
set(gca,'Ytick',[])
axis('square')
title('Original Image')

subplot(1,2,2)
imagesc(thresh,[0,255])
colormap(gray)
set(gca,'Xtick',[])
set(gca,'Ytick',[])
axis('square')
title(['Thresholded DCT Coeffs'])