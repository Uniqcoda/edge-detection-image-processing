function [edges, overlay] = get_kmeans_edge(hsvImg)
    img = uint8(hsvImg);
    % Perform k-means segmentation on the HSV image
    k = 6; % Number of clusters
    [L, ~] = imsegkmeans(img, k);

    % Extract the binary mask for the first cluster
    mask = (L==1);

    % Covert label to RGB image to visualize the binary mask
    maskRgb = label2rgb(mask);

    % Overlay the mask on top of the rgb image
    overlay = labeloverlay(maskRgb, mask);

    edges = edge(rgb2gray(overlay), 'roberts');
end