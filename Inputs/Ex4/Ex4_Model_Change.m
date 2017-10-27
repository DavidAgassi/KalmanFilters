%% FILE NAME: Ex4_Model_Change
% Time for a change

times1 = [1 : 2 : 100]';
times2 = [101 : 2 : 200]';
times = times1;
segLen = length(times1);
noErrVec = zeros(segLen ,1);
basicErrVec = ones(segLen ,1) * 5;

% Line and Stop
vx1 = 3;
vy1 = 5;
vx2 = 0;
vy2 = 0;
seg1X = MakeLine( times, 0, vx1, noErrVec );
seg1Y = MakeLine( times, 0, vy1, noErrVec );
xend = seg1X(end);
yend = seg1Y(end);
seg2X = MakeLine( times, xend, vx2, noErrVec );
seg2Y = MakeLine( times, yend, vy2, noErrVec );

LineStopNoErrors = [ times1 , seg1X , basicErrVec , seg1Y, basicErrVec ;
                    times2 , seg2X , basicErrVec , seg2Y, basicErrVec ];
                
errVec1 = rand(segLen ,1) * 10 + 10;
errVec2 = rand(segLen ,1) * 10 + 10;
seg1X = MakeLine( times, 0, vx1, errVec1 );
seg1Y = MakeLine( times, 0, vy1, errVec1 );
seg2X = MakeLine( times, xend, vx2, errVec2 );
seg2Y = MakeLine( times, yend, vy2, errVec2 );
LineStopNoise = [   times1 , seg1X , errVec1 , seg1Y, errVec1 ;
                    times2 , seg2X , errVec2 , seg2Y, errVec2 ];

% Line And Line
vx2 = -5;
vy2 = 10;
seg1X = MakeLine( times, 0, vx1, noErrVec );
seg1Y = MakeLine( times, 0, vy1, noErrVec );
xend1 = seg1X(end);
yend1 = seg1Y(end);
seg2X = MakeLine( times, xend1, vx2, noErrVec );
seg2Y = MakeLine( times, yend1, vy2, noErrVec );
LineAndLineNoErrors = [ times1 , seg1X , basicErrVec , seg1Y, basicErrVec ;
                        times2 , seg2X , basicErrVec , seg2Y, basicErrVec ];
seg1X = MakeLine( times, 0, vx1, errVec1 );
seg1Y = MakeLine( times, 0, vy1, errVec1 );
seg2X = MakeLine( times, xend1, vx2, errVec2 );
seg2Y = MakeLine( times, yend1, vy2, errVec2 );
LineAndLineNoise = [    times1 , seg1X , errVec1 , seg1Y, errVec1 ;
                        times2 , seg2X , errVec2 , seg2Y, errVec2 ];
% Line And Parabola
v0x = -5;
v0y = 10;
ax = 0.5;
ay = 0.3;
seg1X = MakeParabola( times, 0, v0x, ax, noErrVec );
seg1Y = MakeParabola( times, 0, v0y, ay, noErrVec );
xend1 = seg1X(end);
yend1 = seg1Y(end);
vxend1 = times1(end)*ax+v0x;
vyend1 = times1(end)*ay+v0x;
seg2X = MakeLine( times, xend1, vxend1, noErrVec );
seg2Y = MakeLine( times, yend1, vyend1, noErrVec );
ParabolaAndLineNoErrors = [ times1 , seg1X , basicErrVec , seg1Y, basicErrVec ;
                            times2 , seg2X , basicErrVec , seg2Y, basicErrVec ];
seg1X = MakeParabola( times, 0, v0x, ax, errVec1 );
seg1Y = MakeParabola( times, 0, v0y, ay, errVec1 );
seg2X = MakeLine( times, xend1, vxend1, errVec2 );
seg2Y = MakeLine( times, yend1, vyend1, errVec2 );
ParabolaAndLineNoise = [    times1 , seg1X , errVec1 , seg1Y, errVec1 ;
                            times2 , seg2X , errVec2 , seg2Y, errVec2 ];

save( [pwd '\Inputs\Ex4\Ex4_Model_Change'] , 'LineStopNoErrors' , 'LineStopNoise' , 'ParabolaAndLineNoErrors' , 'ParabolaAndLineNoise' , 'LineAndLineNoErrors'  , 'LineAndLineNoise');