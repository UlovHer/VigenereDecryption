function passwd_table = vigenere_table(letter)
    %¹¹ÔìvigenereÃÜÂë±í
    passwd_table=char(zeros(26,26));
    for i=1:26
        for j=1:26
            n=mod(i+j-1,26);
            if(n == 0)
                n=26;
            end
            passwd_table(i,j)=letter(n);
        end
    end
end