%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- ���������ڸ��ݹ���Ƶ�ʼ�����Ӧ��ֵ ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- ע�� ---- %
        % ---- ����������Ҫ�����ǣ�
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.���ݹ���Ƶ�ʼ�����Ӧ��ֵ
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
function scores = getScoresByFreq(freq)
%{ 
    ---- ע�� ----
    ---- ע�� ----
    ---- ע�� ----
        ��Ӧ��ֵ����Ŀ��Ƶ�ʼ�ȥг��Ƶ�ʵľ���ֵ��
    ---- ע�� ----
    ---- ע�� ----
    ---- ע�� ----
%}
%% ---- ����ȫ�ֱ���
    global objFreq
%% ---- �����㷨�õ���Ӧ��ֵ
    scores = abs(objFreq - freq);
end
