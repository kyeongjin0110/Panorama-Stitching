% Gold-Standard algorithm for computing a homography H from sets of m >= 4
% minimizing the Gold-Standard-Error(GSE) means minimizing the reprojection
function  H = GoldStandard(P1, P2)

    %  parameters:
    %     @ x: contains world points x_i
    %     @ xp: contains imaged points x_i'
    % 	  the points in the two matrices correspond to each other, i.e. H*worldpoints(:,i) = imagepoints(:,i)
    %     	worldpoints = | x1		 xn |			imagepoints = | x1'		 xn'|
    %     				  | y1	...	 yn |						  | y1' ...	 yn'|
    %     				  | w1		 wn |						  | w1'      wn'|
    %     @ mu: defines a termination criterion for the iteration. if the
    %     difference of the estimated parameters between two iterations is < mu, then we
    %     terminate
    % Notes: - method is very sensitive to initialization value.
    %        - points chosen to initialize H must be in a general position!

    x = P1;
    xp = P2;

    mu = 5;

    m = size(x,2);
    
    if (size(xp) ~= size(x) | size(xp,2) < 4 | m < 4)
        error('number of points must be the same, need at least 4 points!');
    end

    % 1. Initialization w/ DLT and 4 correspondences IN GENERAL POSITION gives
    % first estimate Hhat for H
    Hhat = NomalizedDLT(P1, P2);

    % vectorize Hhat
    Hhatv = reshape(Hhat,1,9);

    % vectorize x (assumption: x already inhomogenized, third component = 1)
    initialxh = x(1:2,:);
    initialxh = reshape(initialxh, 1,2*m);

    % first estimate for xhat are x
    P0 = [Hhatv, initialxh]; 

    % 2. Minimization of GSE (reprojection error)
    % set some options for Levenberg-Marquardt
    options = optimset('MaxFunEvals',10000, 'TolX', mu, 'Jacobian', 'off');

    [result,resnorm,residual,exitflag,output] = lsqnonlin(@(P)obj_fun(P,x,xp,m), P0,[],[],options);

    H = reshape(result(1:9),3,3);
    
    % show some information
    output;

    H = H/H(3,3);
    
end