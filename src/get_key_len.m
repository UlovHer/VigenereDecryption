function key_len = get_key_len(ciphertext,ciphertext_len)
%     length=size(ciphertext);
%     length=length(2);
    %密文长度为length
    % loc_str=zeros(1000,10);
%     k=1;
    total_gcd=[];
    for i=3:10
        for j=0:ciphertext_len-i
            sub_str=ciphertext(j+1:j+i);
            temp=strfind(ciphertext,sub_str);
            %         loc_str(k,:)=temp;
            if(numel(temp)>2)
                gcd=maxgcd(temp);
                total_gcd=[total_gcd,gcd];
                fprintf('sub_str：%s',sub_str);
                disp(temp)
                fprintf('%c',8);
                %删掉两个换行符
                fprintf('maxcd：%d\n',gcd);
            end
            %         k=k+1;
            %         for k= 1:length
            %             str_temp=str(k:end);
            %             strfind(str_temp,sub_str)
            %         end
        end
    end
    key_len=mode(total_gcd);
end

 