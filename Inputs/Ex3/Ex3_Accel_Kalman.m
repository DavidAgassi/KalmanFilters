%% FILE NAME: Ex3_Accel_Kalman
% same same, but different

times = [0 : 2 : 500]';
trackLen = length(times);
v0x = -20;
v0y =100;
accx = 1;
accy = -2;
noErrVec = zeros(trackLen ,1);
parX = MakeParabola( times, 0, v0x, accx, noErrVec );
parY = MakeParabola( times, 0, v0y, accy, noErrVec);
errVec = ones(trackLen ,1) * 5;
ParabolaSameInterval = [times , parX , errVec , parY, errVec ];

times = times + rand(trackLen , 1 ) * 0.8;
parX = MakeParabola( times, 0, v0x, accx, noErrVec );
parY = MakeParabola( times, 0, v0y, accy, noErrVec );
ParabolaNoErrors  = [times , parX , errVec , parY, errVec ];

errVecX = ones(trackLen , 1 ) * 5 + 5;
errVecY = rand(trackLen , 1 ) * 5 + 5;
parX = MakeParabola( times, 0, v0x, accx, errVecX );
parY = MakeParabola( times, 0, v0y, accy, errVecY );
ParabolaNoise  = [times , parX , errVecX , parY, errVecY ];

save( [pwd '\Inputs\Ex3\Ex3_Accel_Kalman'] , 'ParabolaSameInterval' , 'ParabolaNoErrors' , 'ParabolaNoise' );