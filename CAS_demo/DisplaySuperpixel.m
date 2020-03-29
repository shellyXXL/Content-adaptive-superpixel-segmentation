function DisplaySuperpixel(pbDir,label,img,iid,numS,subfolder)

    [nRows,nCols,~]=size(img);
    for m=1:nRows
        for n=1:nCols
            L=label(m,n);
            count=0;
            minx=max(m-1,1);
            maxx=min(m+1,nRows);
            miny=max(n-1,1);
            maxy=min(n+1,nCols);
            for u=minx:maxx;
                for v=miny:maxy
                    if(label(u,v)~=L)
                        count=count+1;
                    end
                    if(count==2)
                        break;
                    end
                end
                if(count==2)
                    break;
                end
            end
            if(count==2)
                img(m,n,:)=0;
                img(m,n,1)=0;
            end
        end
    end
     if exist([pbDir,subfolder,'\',num2str(numS),'\superpixel_set'])==0
      mkdir([pbDir,subfolder,'\',num2str(numS),'\superpixel_set']);
     end
     ff = fullfile(pbDir,subfolder,num2str(numS),sprintf('superpixel_set\\%s.bmp',iid));
     imwrite(img,ff,'bmp')
    
end