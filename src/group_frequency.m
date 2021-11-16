function [de_str,dif_char]=group_frequency(ciphertext,letter,key_len)
    %str=ciphertext;
    c_len=length(ciphertext);
    %求密文长度
    g_len=ceil(c_len./key_len);
    %求密文分组的长度
    g_str=strings(key_len,g_len);
    %预先构造矩阵存储分组密文

    %将密文分组
    k=1;
    %分组矩阵的列索引
    for i= 1:c_len
        j=mod(i,key_len);
        %分组矩阵的行索引
        if(j == 0)
            %余数为0时，行索引为6
            j=key_len;
        end
        g_str(j,k)=ciphertext(i);
        if(j == key_len)
            k=k+1;
            %为6时，前1列已经写满，索引指向下一列
        end
    end

    %统计每组密文各个字母个数
    dif_char = unique(ciphertext);
    %计算有多少个不重复的字符串
    % g_str=convertStringsToChars(g_str);%string转化char类型
    number=zeros(key_len,length(dif_char));
    for i = 1:key_len
        temp=g_str(i,:);
        for j=1:length(dif_char)
            dif_char(j);
            number(i,j) = length(cell2mat(strfind(temp,dif_char(j))));
            %统计字符的数目,输出了cell类型，强转为矩阵类型
            %strfind函数在字符串str中查找字符char(i)
        end
    end
    
    %计算频率frequency
    frequency=number;
    for i=1:key_len
        data=number(i,:);
        frequency (i,:)=vpa(data/sum(data),4);
        %控制精度，保留四位小数
    end
    %分别将所有出现过的字符：char,每个char出现的次数：number,每个char出现的频率：frequency
    %输出到名字分别为:(char.xls、number.xls、frequency.xls)的Excel文件中
    %excel文件创建在matlab根目录result文件夹下，写入A1列
    xlswrite('./result/v_char.xls',dif_char);
    xlswrite('./result/v_number.xls',number);
    xlswrite('./result/v_frequency.xls',frequency);

    % % 计算互重合指数
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

    %构造vigenere密码表
    passwd_table = vigenere_table(letter);
   
    %穷举26个密钥，由密码表得出密文，计算得到解密后的频率
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
            %结果存入矩阵t为计数索引
        end
    end
    save('./result/data.mat');
end


% for i = 1:length(dif_char)
%     dif_char(i)
%     for j=1:6
%     temp=g_str(j,:)
%     number(j,i) = length(cell2mat(strfind(temp,dif_char(i))));
%     %统计字符的数目,输出了cell类型，强转为矩阵类型
%     %strfind函数在字符串str中查找字符char(i)
%     end
% end

