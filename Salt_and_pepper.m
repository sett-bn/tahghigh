close all;
clear;
clc;


    image1 = imread("coins.png");
    imshow(image1);
    title('تصویر اصلی');
    figure;

     p = [10, 25, 50];
     noisy_images = struct();

    for i = 1:length(p)
        
        noise = p(i) / 100;
        noisy_images.(sprintf('a%d', i)) = imnoise(image1, 'salt & pepper', noise);
        
        subplot(1,3,i);
        imshow(noisy_images.(sprintf('a%d', i))); 
        title(['تصویر با نویز Salt and Pepper ' num2str(p(i)) '%']);

    end

    figure;
 
   filtered_images = struct(); 

for i = 1:length(p)
  
    filtered_images.(sprintf('b%d', i)) = medfilt2(noisy_images.(sprintf('a%d', i)), [3 3]);
    
    subplot(1,3,i);
    imshow(filtered_images.(sprintf('b%d', i))); 
    title(['تصویر با کاهش نویز ' num2str(p(i)) '%']);
end
   