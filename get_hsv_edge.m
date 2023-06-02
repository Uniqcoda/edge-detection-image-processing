% Edge detection using threshold of HSV color space
function [hsv_edge, imFace] = get_hsv_edge(im, hsvImg)
    % copy the image, to preserve the original
    im1 = hsvImg;
    [row, col, ~] = size(im1);
    imFace = zeros(row,col);
    %{ 
    row = 824, col = 922, dim = 3
    when I checked the improfile of the picture, my face had
    1. h value btw 0.02 and 0.07, while the background had h value above
    0.5 
    2. s value of btw 0.28 and 0.42 while the background had s value below
    0.2 
    3. v value of btw 0.5 and 0.7 while the background was either above or
    below that range.
    %}

    hueThreshold = 0.08;
    saturationThreshold = 0.2;

    for i=1:row
        for j=1:col
            if (im1(i,j,1)<hueThreshold && im1(i,j,2)>saturationThreshold)
                % 1 for my face and 0 for the background
                imFace(i,j) = im(i,j,1);
            end
        end
    end
    hsv_edge = edge(imFace,"roberts");
end