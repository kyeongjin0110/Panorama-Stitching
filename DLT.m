% The Direct Linear Transformation (DLT) algorithm
% P1: 3xN points
% P2: 3xN points
function H = DLT(P1, P2)

    N = size(P1, 2);
    A = zeros(2*N, 9);
    
    % each point correspondence gives us 3 equation, but the third one is a linear
    % combination of the the first two rows => there're just 2 independent
    % equations.
    for i = 1:N
        p1 = P1(:, i)';
        p2_x = P2(1,i);
        p2_y = P2(2,i);
        p2_w = P2(3,i);
        A(2*i-1,:) = [zeros(1,3)  -p2_w*p1  p2_y*p1];
        A(2*i  ,:)   = [p2_w*p1  zeros(1,3)  -p2_x*p1];
    end
     
    [U,D,V] = svd(A);
    
    % take the last row corresponding to the smallest eigen vector
    % Least-squares solution of homogeneous equations
    H = reshape(V(:,9), 3,3)';
    
end