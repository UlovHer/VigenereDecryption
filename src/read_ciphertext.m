function ciphertext=read_ciphertext(txt_path,splice_flag)
    ciphertext =[];   
    file_id= fopen(txt_path,'r');
    if (file_id < -1)
       disp("open file error");
       return;
    end
    temp_text= textscan(file_id,'%s');
    fclose(file_id);
    if splice_flag
    % ����Ƕ��У���ƴ�ӳ�һ��
        for i=1:length(temp_text{1})
            ciphertext = [ciphertext,temp_text{1}{i}];
        end
    end
end