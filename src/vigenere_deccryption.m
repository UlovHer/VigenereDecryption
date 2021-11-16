clc;
clear all;
ciphertext=read_ciphertext('ciphertext.txt',1)
% ciphertext='KCCPKBGUFDPHQTYAVINRRTMVGRKDNBVFDETDGILTXRGUDDKOTFMBPVGEGLTGCKQRACQCWDNAWCRXIZAKFTLEWRPTYCQKYVXCHKFTPONCQQRHJVAJUWETMCMSPKQDYHJVDAHCTRLSVSKCGCZQQDZXGSFRLSWCWSJTBHAFSIASPRJAHKJRJUMVGKMITZHFPDISPZLVLGWTFPLKKEBDPGCEBSHCTJRWXBAFSPEZQNRWXCVYCGAONWDDKACKAWBBIKFTIOVKCGGHJVLNHIFFSQESVYCLACNVRWBBIREPBBVFEXOSCDYGZWPFDTKFQIYCWHJVLNHIQIBTKHJVNPIST';
letter='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
%密文长度为length
length=size(ciphertext);
ciphertext_len=length(2);

%自然语言频率
nlf=[0.08167, 0.01492, 0.02782, 0.04253, 0.12702, 0.02228, 0.02015, 0.06094, 0.06966, 0.00153, 0.00772, 0.04025,0.02406, 0.06749, 0.07507, 0.01929, 0.00095, 0.05987, 0.06327, 0.09056, 0.02758, 0.00978, 0.02360, 0.00150,0.01974, 0.00074];

% 由kasiski测试得到的密钥长度
key_len=get_key_len(ciphertext,ciphertext_len);
[de_str,dif_char]=group_frequency(ciphertext,letter,key_len);
coincidence_index=cal_coincidence_index(de_str,dif_char,nlf,key_len);

%确定秘钥,根据向量之间的夹角来确定
key=search_key(coincidence_index,key_len);
%确定明文
plaintext=get_plaintext(ciphertext,key,key_len)




