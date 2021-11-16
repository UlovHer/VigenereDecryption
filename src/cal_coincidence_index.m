function ci=cal_coincidence_index(de_str,dif_char,nlf,key_len)
    % 统计每组密文各个字母个数
    % dif_char = unique(de_str);
    %计算有多少个不重复的字符串
    % 计算互重合指数     
    ci=zeros(key_len*26,4);
    for i=1:key_len*26
        str=de_str(i,:);
    % dif_char = unique(str);
    %计算有多少个不重复的字符串
        number=zeros(1,length(dif_char));
        de_fre=number;
        t=fix((i-1)./26);
        for j=1:length(dif_char)
            dif_char(j);
            number(1,j) = length(cell2mat(strfind(str,dif_char(j))));
            ci(j+t.*26,1)=t+1;
            ci(j+t.*26,2)=j;
        %统计字符的数目,输出了cell类型，强转为矩阵类型
        %strfind函数在字符串str中查找字符char(i)
        end
        de_fre(:)=vpa(number/sum(number),4);
        ci(i,3)=i;
        ci(i,4)=sum(de_fre.*nlf);
        
    %     ci=sum(de_fre.^2)
    %     er=abs(ci-0.068);
    %     if(er<=0.001)
    %         i
    %     end
    end
end



