function write_plaintext(plaintext,txt_path)
    file_id= fopen(txt_path,'w');
    if (file_id < -1)
       disp("open file error");
       return;
    end
    fwrite(file_id,plaintext);
    fclose(file_id);
end