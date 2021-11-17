function plaintext=get_plaintext(ciphertext,ciphertext_len,key,key_len)
    plaintext=ciphertext;
    for i=1:ciphertext_len
        char_cipher=ciphertext(i);
        %密文->明文,秘钥为key(i)
        %key(mod(i,key_len))
        key_index=mod(i,key_len);
        if (key_index==0)
            key_index=6;
        end
        char_plain=mod(char_cipher-key(key_index)+26,26);
        %将字母转换为数字,'A'对应0,'Z'对应25
        %部分字母为负,加26后,变为正
        plaintext(i)=char('A'+char_plain);
        %将数字转换为字母
    end 
end