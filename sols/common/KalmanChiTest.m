function Xo_testResult = KalmanChiTest( Xi_testRes )
ChiTestConst;
    Xo_testResult=(sum(Xi_testRes>CTCFail))==CTCHistoryLen;
end