function key=search_key(coincidence_index,key_len)
    %找出密钥
    key=char(zeros(1,key_len));
    for i=1:key_len
            index=(i-1)*26;
            temp=coincidence_index(index+1:index+26,4);
    %         max(temp);
            place=find(coincidence_index(:,4)==max(temp));
            key(i)=coincidence_index(place,2)+'A'-1;
    %         sprintf('分组\t 密钥\t 明文\t MCI')
    %         disp(['    分组    ','    密钥   ','    明文   ','    MCI    ']);
    %         disp([coincidence_index(place,1),coincidence_index(place,2)+'A',coincidence_index(place,3),coincidence_index(place,4)]);
    %         disp(sprintf('分组 %d\t\t密钥 %s\t\t明文 %d\t\tMCI %f',coincidence_index(place,1),(coincidence_index(place,2)+'A'-1),coincidence_index(place,3),coincidence_index(place,4)))
            fprintf('分组 %d\t\t密钥 %s\t\t明文 %d\t\tMCI %f\n',coincidence_index(place,1),(coincidence_index(place,2)+'A'-1),coincidence_index(place,3),coincidence_index(place,4))

    %         coincidence_index(place,:);
    end
    fprintf('key为：%s\n',key);
end