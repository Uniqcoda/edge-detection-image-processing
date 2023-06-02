% funtion to draw my initials on my photo
function my_im = draw_initials(im)
    % Add my initials (letter M), with triple lines to make it obvious
    for i=30:270
        % left vertical line: set red and green to zero to make blue line
        im(i,30,1:2)=0;
        im(i,31,1:2)=0;
        im(i,32,1:2)=0;
        % right vertical line: set green to 255 to make green
        im(i,270,2)=255;
        im(i,269,2)=255;
        im(i,268,2)=255;
        if (i <= 150)  % 150 is the mid-point between 30 and 270
            % left diagonal: set red to zero to make cyan
            im(i,i,1)=0;
            im(i+1,i,1)=0;
            im(i+2,i,1)=0;
            % right diagonal: set all rgb to zero make black 
            im(i,270-i+30,1:3)=0;
            im(i+1,270-i+30,1:3)=0; 
            im(i+2,270-i+30,1:3)=0; 
        end
    end
    my_im = im;
end