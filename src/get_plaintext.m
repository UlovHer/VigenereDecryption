function plaintext=get_plaintext(ciphertext,key,key_len)
    for i=1:key_len
        cipher_temp=ciphertext
        %每一行使用同一个凯撒码
        cipher_temp=cipher_temp-'A';
        %将字母转换为数字,'A'对应0,'Z'对应25
        cipher_temp=mod(cipher_temp-key(i),26);
        %密文->明文,秘钥为key(i)
        ciphertext=cipher_temp;
    end
    plaintext=reshape(ciphertext,1,[]);
    plaintext(plaintext<0)=[];
    %删除可能存在的空格
    plaintext=plaintext+('A'-0);
    plaintext=char(plaintext);
    %将数字转换为字母
end