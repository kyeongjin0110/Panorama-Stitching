%% Read Images
I1 = imread('./img1.jpg');
I2 = imread('./img2.jpg');

% Rotate -90
I1 = imrotate(I1,-90);
I2 = imrotate(I2,-90);

load('./P1.mat')
load('./P2.mat')

% ginput coordinate
N_point = 4;

% n features for first image
imshow(I1,[])
[x1, y1] = ginput(N_point);

% n features for second image
imshow(I2,[])
[x2, y2] = ginput(N_point);

P1 = [x1, y1];
P2 = [x2, y2];

P1  = [P1 ones(4,1)]';
P2  = [P2 ones(4,1)]';

%% DLT
%H = DLT(P1, P2);

%% Nomalized DLT
%H = NomalizedDLT(P1, P2);

%% Gold Standard Algorithm
H = GoldStandard(P1, P2);

%% Homography Transform Error
disp('homography transform error')
error = H*P1;
error = P2 - error ./ error(3,:)

%% Save Result
result = geokor(H, I1, I2);
%imwrite(result, './panorama_result_DLT.jpg')
%imwrite(result, './panorama_result_nDLT.jpg')
%imwrite(result, './panorama_result_GoldStandard.jpg')
imshow(result)


