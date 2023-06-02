function [gray_seg, gray_edge] = get_gray_edge(grayImg)     
    [row, col, ~] = size(grayImg);
    %{ 
    row = 824, col = 922, dim = 1
    when I checked the improfile of the grayscale, my face had values of
    between 110 and 170 
    %}
    thresh1 = 110;
    thresh2 = 170;

    for i=1:row
        for j=1:col
            if (grayImg(i,j)>thresh1 && grayImg(i,j)<thresh2)
                grayImg(i,j)=255; % for skin tone
            else
                grayImg(i,j)=0; % for background
            end
        end
    end
    se = strel('disk', 2);
    erodedMask = imerode(grayImg, se);
    gray_seg = imdilate(erodedMask, se);
    gray_edge = edge(gray_seg,"roberts");
end