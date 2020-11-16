% P: 3xN point matrix
function [P_out, T] = normalize(P)

    centroid = mean(P(1:2,:), 2); 
    
    % subthe all points from the centroid
    P1(1,:) = P(1,:) - centroid(1);
    P1(2,:) = P(2,:) - centroid(2);
    
    % normalize all points to the range of [0,1]
    dst = sqrt(P1(1,:).^2 + P1(2,:).^2);
    max_dst = max(dst);
    s = 1.0/max_dst;
    
    % create the normalization matrix, which is a concatenation of scale
    % and translation matrices.
    T = [s  0 -s*centroid(1)
         0  s -s*centroid(2)
         0  0  1    ];
     
    % transform the points
    P_out = T * P;
    
end