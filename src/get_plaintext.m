function plaintext=get_plaintext(ciphertext,ciphertext_len,key,key_len)
    plaintext=ciphertext;
    for i=1:ciphertext_len
        char_cipher=ciphertext(i);
        %����->����,��ԿΪkey(i)
        %key(mod(i,key_len))
        key_index=mod(i,key_len);
        if (key_index==0)
            key_index=6;
        end
        char_plain=mod(char_cipher-key(key_index)+26,26);
        %����ĸת��Ϊ����,'A'��Ӧ0,'Z'��Ӧ25
        %������ĸΪ��,��26��,��Ϊ��
        plaintext(i)=char('A'+char_plain);
        %������ת��Ϊ��ĸ
    end 
end