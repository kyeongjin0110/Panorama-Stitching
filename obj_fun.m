% represents the objective function for the reprojection error
function  F  = obj_fun(P, x, xp, m)

    % P = [Hhat1, ..., Hhat9, xh1, yh1, xh2, yh2 ...., xhm, yhm]
    % Hhat: estimate of H, xh (=xhat) : estimate of x
    % 2m + 9 parameters

    % get H
    H = reshape(P(1:9),3,3);

    % assuming pts x,xp are already inhomogenized
    x = x(1:2,:);
    xp = xp(1:2,:);

    % obtain xh 
    xh = P(10:end);
    xh = reshape(xh,2,m);
    
    % xh already inhomogenized
    xh = [xh; ones(1,m)];
    
    % obtain xhp, inhomogenize all xhp
    xhp = H * xh;
    xhp = xhp./(repmat(xhp(3,:),3,1));

    xh = xh(1:2,:);
    xhp = xhp(1:2,:);
    
    % calculate error function 
    i = 1:m;
    dworld = (x(1,i) - xh(1,i)).^2 + (x(2,i) - xh(2,i)).^2;
    dimage = (xp(1,i) - xhp(1,i)).^2 + (xp(2,i) - xhp(2,i)).^2;

    F = dworld + dimage; % error in both images  
    
end
