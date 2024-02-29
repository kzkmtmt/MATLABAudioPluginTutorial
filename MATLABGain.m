classdef MATLABGain < audioPlugin
    properties
        g = 0 % ⾳量のパラメータ．0 dB で初期化．
    end

    properties(Constant)
        PluginInterface = audioPluginInterface( ...
            audioPluginParameter(...
            'g',...                         % プロパティ名
            'DisplayName','Gain',...        % 表⽰されるパラメータの名称
            'Mapping',{'lin',-20,20},...    % -20から, 20まで
            'Label','dB'...                 % 単位はdB
            )...
            );
    end

    methods
        function y = process(p,x)
            a = 10^(p.g/20); % デシベル値から振幅係数を計算
            y = a*x;         % ⾳量を変化させて出⼒．
        end
    end
end