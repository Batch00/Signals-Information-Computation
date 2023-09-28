function [DCT_Coef] = DCTBlock(im,rowblk,colblk);

% Extract the 8 by 8 block of image im in the rowblk, colblk location and
% compute the 2D DCT coefficients of the block.  Display the block of the
% image and the absolute value of the corresponding DCT coefficients in a
% figure


mrange = (rowblk-1)*8+1:(rowblk-1)*8+8;
nrange = (colblk-1)*8+1:(colblk-1)*8+8;

[M,N] = size(im);

if (max(mrange) > M)
    print('Not enough rows in image for this block')
    stop
end
if (max(nrange) > N)
    print('Not enough columns in image for this block')
    stop
end

block = im(mrange,nrange);
 
figure
subplot(1,2,1)
imagesc(block,[0,255])
colormap(gray)
xlabel('m')
ylabel('n')
set(gca,'Xtick',[])
set(gca,'Ytick',[])
axis('square')
title(['Image Block Row ',num2str(rowblk),', Col ',num2str(colblk)])

DCT_Coef = dct2(block);

subplot(1,2,2)
imagesc(abs(DCT_Coef))
colormap(gray)
xlabel('l')
ylabel('k')
set(gca,'Xtick',[])
set(gca,'Ytick',[])
axis('square')
title(['DCT Coeffs'])