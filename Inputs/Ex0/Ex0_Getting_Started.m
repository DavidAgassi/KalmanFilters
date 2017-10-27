%% FILE NAME: Ex0_Getting_Started
% who what when where how

times = [0 : 9]';
trackLen = length(times);
noErrVec = zeros(trackLen ,1);
errVec = ones(trackLen ,1) * 5;

vx = -5;
vy = 10;
lineX = MakeLine( times, 0, vx, noErrVec );
lineY = MakeLine( times, 0, vy, noErrVec );
LineNoError = [ times , lineX, errVec , lineY , errVec ];

lineX = MakeLine( times, 0, vx, errVec );
lineY = MakeLine( times, 0, vy, errVec );
LineNoise = [ times , lineX, errVec , lineY , errVec ];

save( [pwd '\Inputs\Ex0\Ex0_Getting_Started'] , 'LineNoError' , 'LineNoise' );