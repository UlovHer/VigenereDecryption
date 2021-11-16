function [de_str,dif_char]=group_frequency(ciphertext,letter,key_len)
    %str=ciphertext;
    c_len=length(ciphertext);
    %�����ĳ���
    g_len=ceil(c_len./key_len);
    %�����ķ���ĳ���
    g_str=strings(key_len,g_len);
    %Ԥ�ȹ������洢��������

    %�����ķ���
    k=1;
    %��������������
    for i= 1:c_len
        j=mod(i,key_len);
        %��������������
        if(j == 0)
            %����Ϊ0ʱ��������Ϊ6
            j=key_len;
        end
        g_str(j,k)=ciphertext(i);
        if(j == key_len)
            k=k+1;
            %Ϊ6ʱ��ǰ1���Ѿ�д��������ָ����һ��
        end
    end

    %ͳ��ÿ�����ĸ�����ĸ����
    dif_char = unique(ciphertext);
    %�����ж��ٸ����ظ����ַ���
    % g_str=convertStringsToChars(g_str);%stringת��char����
    number=zeros(key_len,length(dif_char));
    for i = 1:key_len
        temp=g_str(i,:);
        for j=1:length(dif_char)
            dif_char(j);
            number(i,j) = length(cell2mat(strfind(temp,dif_char(j))));
            %ͳ���ַ�����Ŀ,�����cell���ͣ�ǿתΪ��������
            %strfind�������ַ���str�в����ַ�char(i)
        end
    end
    
    %����Ƶ��frequency
    frequency=number;
    for i=1:key_len
        data=number(i,:);
        frequency (i,:)=vpa(data/sum(data),4);
        %���ƾ��ȣ�������λС��
    end
    %�ֱ����г��ֹ����ַ���char,ÿ��char���ֵĴ�����number,ÿ��char���ֵ�Ƶ�ʣ�frequency
    %��������ֱַ�Ϊ:(char.xls��number.xls��frequency.xls)��Excel�ļ���
    %excel�ļ�������matlab��Ŀ¼result�ļ����£�д��A1��
    xlswrite('./result/v_char.xls',dif_char);
    xlswrite('./result/v_number.xls',number);
    xlswrite('./result/v_frequency.xls',frequency);

    % % ���㻥�غ�ָ��
    % for i=1:key_len
    %     f_data=frequency(i,:); 
    %     for j=1:26
    %         for k=1:26
    %             ci=f_data(j).*nlf(k);
    %             er=abs(ci-0.0068);
    %             if(er<=0.001)
    %                 i,j,k
    %             end
    %         end
    %     end
    % end

    %����vigenere�����
    passwd_table = vigenere_table(letter);
   
    %���26����Կ���������ó����ģ�����õ����ܺ��Ƶ��
    de_str=strings(key_len.*26,g_len);
    t=1;
    for i=1:key_len
        en_data=g_str(i,:);
        de_data=en_data;
        for j=1:26
            for n=1:g_len
    %             k=strfind(letter,en_data(n));
                k=strfind(passwd_table(j,:),en_data(n));
    %             de_data(n)=p_table(j,k);
                de_data(n)=letter(k);
            end
            de_str(t,:)=de_data;
            t=t+1;
            %����������tΪ��������
        end
    end
    save('./result/data.mat');
end


% for i = 1:length(dif_char)
%     dif_char(i)
%     for j=1:6
%     temp=g_str(j,:)
%     number(j,i) = length(cell2mat(strfind(temp,dif_char(i))));
%     %ͳ���ַ�����Ŀ,�����cell���ͣ�ǿתΪ��������
%     %strfind�������ַ���str�в����ַ�char(i)
%     end
% end

