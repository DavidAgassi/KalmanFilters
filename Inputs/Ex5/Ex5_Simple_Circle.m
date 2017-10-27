%% FILE NAME: Ex5_Simple_Circle
% have fun
XCen = 0;
YCen = 0;
R = 1000;
azi0 = pi/30;
AV = pi/15;

times = [0 : 2 : 15]';
trackLen = length(times);
noErrVec = zeros(trackLen ,1);
errVec = ones(trackLen ,1) * 5;

[Xs , Ys] = MakeCircle(times,XCen,YCen,R,AV,azi0,noErrVec,noErrVec);
CircleCenterHalfNoErrors = [ times , Xs , errVec , Ys , errVec ];

errR = rand(trackLen ,1) * 50 + 50;
errAV = rand(trackLen ,1) * pi/90 + pi/90;
[Xs , Ys] = MakeCircle(times,XCen,YCen,R,AV,azi0,errR,errAV);
CircleCenterHalfNoise = [ times , Xs , errR , Ys , errAV ];

times = [0 : 2 : 150]';
trackLen = length(times);
noErrVec = zeros(trackLen ,1);
errVec = ones(trackLen ,1) * 5;

[Xs , Ys] = MakeCircle(times,XCen,YCen,R,AV,azi0,noErrVec,noErrVec);
CircleCenterFullCirclesNoErrors = [ times , Xs , errVec , Ys , errVec ];

errR = ones(trackLen ,1) * 100;
errAV = ones(trackLen ,1) * pi/45;
[Xs , Ys] = MakeCircle(times,XCen,YCen,R,AV,azi0,errR,errAV);
CircleCenterFullCirclesNoise = [ times , Xs , errR , Ys , errAV ];

save( [pwd '\Inputs\Ex5\Ex5_Simple_Circle'] , 'CircleCenterHalfNoErrors' , 'CircleCenterHalfNoise' , 'CircleCenterFullCirclesNoErrors' , 'CircleCenterFullCirclesNoise');