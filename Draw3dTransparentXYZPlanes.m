function Draw3dTransparentXYZPlanes(h,position, plane, colour, alpha,varargin)
    plane = lower(plane);
    normdir = setdiff('xyz',plane);
    if nargin > 5         
         eval(sprintf('%sp = varargin{1}(1:2);', plane(1)));
         eval(sprintf('%sp = varargin{1}(3:4);', plane(2)));
    else
        xp = get(h,'Xlim');
        yp = get(h,'Ylim');
        zp = get(h,'Zlim');
    end

    
    % Use the axes x and Y limits to find the co-ordinates for the patch
%     x1 = [ xp(1) xp(2) xp(2) xp(1)];
%     y1 = [ yp(1) yp(1) yp(2) yp(2)];
    v1 = sprintf('%s1 = [%sp(1) %sp(2) %sp(2) %sp(1)];', plane(1),plane(1),plane(1),plane(1),plane(1));
    v2 = sprintf('%s1 = [%sp(1) %sp(1) %sp(2) %sp(2)];', plane(2),plane(2),plane(2),plane(2),plane(2));
    v3 = sprintf('%s1 = ones(1,4)* position;', normdir);
%     z1 = ones(1,numel(y1))* position;
    eval(v1);
    eval(v2);
    eval(v3);
    v = patch(x1,y1,z1, colour);
    set(v,'facealpha',alpha);
    set(v,'edgealpha',alpha);
    set(gcf,'renderer','opengl') ;
end