%% FILE NAME: Ex1_Simple_Kalman
% the first steps into a whole new world

times = [1 : 2 : 500]';
trackLen = length(times);
vx = 2;
vy = 5;
noErrVec = zeros(trackLen ,1);
lineX = MakeLine( times, 0, vx, noErrVec );
lineY = MakeLine( times, 0, vy, noErrVec);
errVec = ones(trackLen ,1) * 5;
LineSimpleSameInterval = [times , lineX , errVec , lineY, errVec ];

times = times + rand(trackLen , 1 ) * 0.8;
lineX = MakeLine( times, 0, vx, noErrVec );
lineY = MakeLine( times, 0, vy, noErrVec );
LineSimpleNoErrors  = [times , lineX , errVec , lineY, errVec ];

errVecX = rand(trackLen , 1 ) * 5 + 5;
errVecY = rand(trackLen , 1 ) * 5 + 5;
lineX = MakeLine( times, 0, vx, errVecX );
lineY = MakeLine( times, 0, vy, errVecY );
LineSimpleNoise  = [times , lineX , errVecX , lineY, errVecY ];

save( [pwd '\Inputs\Ex1\Ex1_Simple_Kalman'] , 'LineSimpleSameInterval' , 'LineSimpleNoErrors' , 'LineSimpleNoise' );