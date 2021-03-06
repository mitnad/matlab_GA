%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本函数用于根据工作频率和S11计算适应度值 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本函数的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.根据工作频率和S11计算适应度值
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                       
function scores = getScoresByFreqAndS11_V3(freq, s11)
%% ---- 声明全局变量
    global objFreq
%% ---- 得到初始的适应度值
    scores = abs(objFreq - freq);
%% ---- 根据算法修改适应度值
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            此处的算法是：
                如果-10 < s11，就意味着此处的freq可能只是一个谐振点，性能不好，
                    所以即使这个freq达到误差要求，也要舍去，也就是增加它的适应度值。
                        使用的方法是：
                            scores = scores + 0.05;
                如果-15 < s11 <= -10，此时，freq可能是天线的谐振点，也可能不是
                    但是这个freq的性能不好，所以也要增加它的适应度值
                        使用的方法是：
                            scores = scores + 0.025;
                如果-20 < s11 <= -15，此时，freq可能是天线的谐振点，也可能不是
                    但是这个freq的性能一般，所以也要适当增加它的适应度值
                        使用的方法是：
                            scores = scores + 0.015;
                        这里要使用0.005，也即意味着objFreq这三个谐振频率都能满足终止条件，因为精度是0.02
                如果-30 < s11 <= -25，此时，freq可能是天线的谐振点，也可能不是
                    但是这个freq的性能不错，所以也要适当减小它的适应度值
                        使用的方法是：
                            scores = scores - 0.005;
                        这里要使用0.005，也即意味着objFreq - 0.02，objFreq - 0.01，objFreq，objFreq + 0.01，objFreq + 0.02这三个谐振频率都能满足终止条件，因为精度是0.02
                如果s11 <= -30，此时，则这个freq的性能非常好，所以要适当减小它的适应度值
                        使用的方法是：
                            scores = scores - 0.015;
                        这里要使用0.015，也即意味着objFreq - 0.03，objFreq - 0.02，objFreq - 0.01，objFreq，objFreq + 0.01，objFreq + 0.02，objFreq + 0.03这三个谐振频率都能满足终止条件，因为精度是0.02
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    if s11 > -10
        scores = scores + 0.05;
    elseif s11 > -15 && s11 <= -10
        scores = scores + 0.025;
    elseif s11 > -20 && s11 <= -15
        scores = scores + 0.015;
    elseif s11 > -30 && s11 <= -25
        scores = scores - 0.005;
    elseif s11 <= -30
        scores = scores - 0.015;
    end
end

