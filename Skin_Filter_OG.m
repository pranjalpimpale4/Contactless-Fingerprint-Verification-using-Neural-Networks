clc
close all
clear all
%function skin_filter()
srcFile=dir('C:\Users\sanchit\Desktop\Kaushik_OGs\*.jpg');
%srcFile=dir('C:\Users\sanchit\Desktop\Fingerprint_Dataset\OGs\Kaushik\*.jpg');
for r=1:length(srcFile)
     path = strcat('C:\Users\sanchit\Desktop\Kaushik_OGs\',srcFile(r).name);
    %path = strcat('C:\Users\sanchit\Desktop\Fingerprint_Dataset\OGs\Kaushik\',srcFile(r).name);
    I=imread(path);
    %figure,imshow(I);
    count = 0;
    %disp(size(I));
    %disp(size(I,1));
    %disp(size(I,2));
    %disp(size(I,3));
    %%skin region in rgb image%%%%%%%%% 
    if(size(I, 3) > 1)
        final_image = zeros(size(I,1), size(I,2));
        for i = 1:size(I,1)
            for j = 1:size(I,2)
                R = I(i,j,1);
                G = I(i,j,2);
                B = I(i,j,3);
                if(R > 95 && G > 40 && B > 20)
                    v = [R,G,B];
                    count = count + 1;
                    if((max(v) - min(v)) > 15)
                        if(abs(R-G) > 15 && R > G && R > B)
                            %it is a skin
                            final_image(i,j) = 1;
                        end
                    end
                end
            end
        end
    end
     disp(count);
       % figure, imshow(final_image);


    H = imread(path);
    % Get the dimensions of the image.  numberOfColorBands should be = 1.
    [rows, columns, numberOfColorBands] = size(H);    




    if numberOfColorBands == 1
      maskedImage = H; % Initialize with the entire image.
      maskedImage(~final_image) = 0; % Zero image outside the circle mask.
    else
      % Mask the image.
      maskedImage = bsxfun(@times, H, cast(final_image,class(H)));
end

%figure, imshow(maskedImage, []); 
%database = strcat('C:\Users\sanchit\Desktop\Fingerprint_Dataset\save\Kaushik\Skin\',srcFile(r).name);
database = strcat('C:\Users\sanchit\Desktop\Kaushik_skin\',srcFile(r).name);
imwrite(maskedImage,database);
end





     %   b = im2double(final_image);
      %   d = im2double(I);


     %    u = imresize (b, [400,400]);
     %    v= imresize (d, [400,400]);
      %   e=imadd (u,v);


     %    figure(3)
      %   imshow(e)


    % BW=final_image;
    % else
    %    BW=im2bw(I);
    % figure, imshow(BW);
    %disp('convert');
    %end


    %L = bwlabel(BW,4);
    %BB = regionprops(L, 'BoundingBox');
    %BB1 =struct2cell(BB);
    %BB2 = cell2mat(BB1);
    %[s1 s2]=size(BB2);
    %mx=0;
    %for k=3:4:s2-1
     %   p=BB2(1,k)*BB2(1,k+1);
      %  if p>mx && (BB2(1,k)/BB2(1,k+1))<2
       %     mx=p;
        %    j=k;
        %end
    %end
%end