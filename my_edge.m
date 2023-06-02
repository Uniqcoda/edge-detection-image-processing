function myedge = my_edge(im)
    % Using convolution mask
    h = [
        1, 0, 1;
        0, 1, 0;
        -1, -1, -1;
    ];
    % my work
    myedge = conv2(im, h);