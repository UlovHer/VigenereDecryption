function ci=cal_coincidence_index(de_str,dif_char,nlf,key_len)
    % ͳ��ÿ�����ĸ�����ĸ����
    % dif_char = unique(de_str);
    %�����ж��ٸ����ظ����ַ���
    % ���㻥�غ�ָ��     
    ci=zeros(key_len*26,4);
    for i=1:key_len*26
        str=de_str(i,:);
    % dif_char = unique(str);
    %�����ж��ٸ����ظ����ַ���
        number=zeros(1,length(dif_char));
        de_fre=number;
        t=fix((i-1)./26);
        for j=1:length(dif_char)
            dif_char(j);
            number(1,j) = length(cell2mat(strfind(str,dif_char(j))));
            ci(j+t.*26,1)=t+1;
            ci(j+t.*26,2)=j;
        %ͳ���ַ�����Ŀ,�����cell���ͣ�ǿתΪ��������
        %strfind�������ַ���str�в����ַ�char(i)
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



