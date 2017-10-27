%% FILE NAME: Ex2_Model_Error
% Q is sending 007 on a tracking mission

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
                
errVec1 = rand(segLen ,1) * 5 + 5;
errVec2 = rand(segLen ,1) * 5 + 5;
seg1X = MakeLine( times, 0, vx1, errVec1 );
seg1Y = MakeLine( times, 0, vy1, errVec1 );
seg2X = MakeLine( times, xend, vx2, errVec2 );
seg2Y = MakeLine( times, yend, vy2, errVec2 );
LineStopNoise = [   times1 , seg1X , errVec1 , seg1Y, errVec1 ;
                    times2 , seg2X , errVec2 , seg2Y, errVec2 ];
% Line Shift
seg1X = MakeLine( times, 0, vx1, noErrVec );
seg1Y = MakeLine( times, 0, vy1, noErrVec );
xend = seg1X(end);
yend = seg1Y(end);
shiftx = 50;
shifty = -30;
seg2X = MakeLine( times, xend + shiftx, vx1, noErrVec );
seg2Y = MakeLine( times, yend + shifty, vy1, noErrVec );
LineShiftNoErrors = [   times1 , seg1X , basicErrVec , seg1Y, basicErrVec ;
                        times2 , seg2X , basicErrVec , seg2Y, basicErrVec ];
                    
seg1X = MakeLine( times, 0, vx1, errVec1 );
seg1Y = MakeLine( times, 0, vy1, errVec1 );
seg2X = MakeLine( times, xend + shiftx, vx1, errVec2 );
seg2Y = MakeLine( times, yend + shifty, vy1, errVec2 );
LineShiftNoise = [   times1 , seg1X , errVec1 , seg1Y, errVec1 ;
                        times2 , seg2X , errVec2 , seg2Y, errVec2 ];
% Line 3 segments
times3 = [201 : 2 : 300]';
vx2 = -5;
vy2 = 10;
vx3 = 15;
vy3 = -10;
seg1X = MakeLine( times, 0, vx1, noErrVec );
seg1Y = MakeLine( times, 0, vy1, noErrVec );
xend1 = seg1X(end);
yend1 = seg1Y(end);
seg2X = MakeLine( times, xend1, vx2, noErrVec );
seg2Y = MakeLine( times, yend1, vy2, noErrVec );
xend2 = seg2X(end);
yend2 = seg2Y(end);
seg3X = MakeLine( times, xend2, vx3, noErrVec );
seg3Y = MakeLine( times, yend2, vy3, noErrVec );
Line3SegmentsNoErrors = [   times1 , seg1X , basicErrVec , seg1Y, basicErrVec ;
                            times2 , seg2X , basicErrVec , seg2Y, basicErrVec ;
                            times3 , seg3X , basicErrVec , seg3Y, basicErrVec ];
errVec3 = rand(segLen ,1) * 5 + 5;
seg1X = MakeLine( times, 0, vx1, errVec1 );
seg1Y = MakeLine( times, 0, vy1, errVec1 );
seg2X = MakeLine( times, xend1, vx2, errVec2 );
seg2Y = MakeLine( times, yend1, vy2, errVec2 );
seg3X = MakeLine( times, xend2, vx3, errVec3 );
seg3Y = MakeLine( times, yend2, vy3, errVec3 );
Line3SegmentsNoise = [  times1 , seg1X , errVec1 , seg1Y, errVec1 ;
                        times2 , seg2X , errVec2 , seg2Y, errVec2 ;
                        times3 , seg3X , errVec3 , seg3Y, errVec3 ];

save( [pwd '\Inputs\Ex2\Ex2_Model_Error'] , 'LineStopNoErrors' , 'LineStopNoise' , 'LineShiftNoErrors' , 'LineShiftNoise' , 'Line3SegmentsNoErrors'  , 'Line3SegmentsNoise');