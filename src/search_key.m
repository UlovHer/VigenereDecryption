function key=search_key(coincidence_index,key_len)
    %�ҳ���Կ
    key=char(zeros(1,key_len));
    for i=1:key_len
            index=(i-1)*26;
            temp=coincidence_index(index+1:index+26,4);
    %         max(temp);
            place=find(coincidence_index(:,4)==max(temp));
            key(i)=coincidence_index(place,2)+'A'-1;
    %         sprintf('����\t ��Կ\t ����\t MCI')
    %         disp(['    ����    ','    ��Կ   ','    ����   ','    MCI    ']);
    %         disp([coincidence_index(place,1),coincidence_index(place,2)+'A',coincidence_index(place,3),coincidence_index(place,4)]);
    %         disp(sprintf('���� %d\t\t��Կ %s\t\t���� %d\t\tMCI %f',coincidence_index(place,1),(coincidence_index(place,2)+'A'-1),coincidence_index(place,3),coincidence_index(place,4)))
            fprintf('���� %d\t\t��Կ %s\t\t���� %d\t\tMCI %f\n',coincidence_index(place,1),(coincidence_index(place,2)+'A'-1),coincidence_index(place,3),coincidence_index(place,4))

    %         coincidence_index(place,:);
    end
    fprintf('keyΪ��%s\n',key);
end