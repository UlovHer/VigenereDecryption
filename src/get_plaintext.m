function plaintext=get_plaintext(ciphertext,key,key_len)
    for i=1:key_len
        cipher_temp=ciphertext
        %ÿһ��ʹ��ͬһ��������
        cipher_temp=cipher_temp-'A';
        %����ĸת��Ϊ����,'A'��Ӧ0,'Z'��Ӧ25
        cipher_temp=mod(cipher_temp-key(i),26);
        %����->����,��ԿΪkey(i)
        ciphertext=cipher_temp;
    end
    plaintext=reshape(ciphertext,1,[]);
    plaintext(plaintext<0)=[];
    %ɾ�����ܴ��ڵĿո�
    plaintext=plaintext+('A'-0);
    plaintext=char(plaintext);
    %������ת��Ϊ��ĸ
end