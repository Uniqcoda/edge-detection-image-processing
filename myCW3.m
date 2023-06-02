function myCW3()
    im = imread("photo1.jpg");

    [~, ~, dim] = size(im);
    if dim > 1
        % convert to gray image, if the image is not gray
        grayImg1 = rgb2gray(im);
    else
        grayImg1 = im;
    end

    % 1. draw my initials
    my_im = draw_initials(im);

    % 2. Matlab inbuilt method
    edge_rob = edge(grayImg1, "roberts");

    % 3. Using convolution mask
    myedge = my_edge(grayImg1);

    % convert to hsv
    hsvImg = rgb2hsv(im);

    % 4. Edge detection using HSV and thresholds
    [hsv_edge, hvs_seg] = get_hsv_edge(im, hsvImg);

    % 5. Edge detection using Gray image and thresholds
    [gray_seg, gray_edge] = get_gray_edge(grayImg1);
    
    % 6. Edge detection using k-means
    [edgeKM, overlay] = get_kmeans_edge(hsvImg);

    % 7. Edge detection using SVM
    svm_edge = get_svm_edge(im);

    % Larger image with my initials
    figure(2), imshow(my_im), title("Original with initials");
    
    % Subplots of all results
    figure(1),
    subplot(3,4,1), imshow(im);
    title("1. Original")
    subplot(3,4,2), imshow(edge_rob);
    title("2. Default Roberts")
    subplot(3,4,3), imshow(myedge);
    title("3. My Conv Edge")
    subplot(3,4,4), imshow(hvs_seg);
    title("4. HSV Segment")
    subplot(3,4,5), imshow(hsv_edge);
    title("5. HSV Edge: Roberts")
    subplot(3,4,6), imshow(edge(hvs_seg,"sobel"));
    title("6. HSV Edge: Sobel")
    subplot(3,4,7), imshow(gray_seg);
    title("7. Gray Segment")
    subplot(3,4,8), imshow(gray_edge);
    title("8. Gray Edge: Roberts")
    subplot(3,4,9), imshow(edge(gray_seg,"sobel"));
    title("9. Gray Edge: Sobel")
    subplot(3,4,10), imshow(overlay);
    title("10. K-Means Overlay")
    subplot(3,4,11), imshow(edgeKM);
    title("11. K-Means Edge")
    subplot(3,4,12), imshow(svm_edge);
    title("12. SVM Edge")
end
