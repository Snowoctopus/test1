function F=costplot(i)

%name={'bnh4_f','bno2_f','bo_f','nh4_f','no2_f','no3_f','p3_f','z3_f','d_f','o_f'};
%for i=1:numel(name)
%    eval([['file',num2str(i)],'=','char(name(i))']);
%    temp=[eval(['file',num2str(i)]),'.txt'];
%    filet(1,i)={temp};  %#ok<NASGU>
%end
%clear file1 file2 file3 file4 file5 file6 
%clear file7 file8 file9 file10 temp i name
%%par={'AOO','NOO','BHET','NH4','NO2','NO3','P','Z','D','OXY'};
maindir='/data/gpfs02/sjgao/MogeDu/GLUE2/test1/';
subdir=dir(maindir);
num=length(subdir)-3;
clear maindir subdir
name={'bnh4','bno2','bo','nh4','no2','no3','p3','zoo3','d','o'};
file={'bnh4.txt','bno2.txt','bo.txt','nh4.txt','no2.txt', ...
    'no3.txt','p3.txt','zoo3.txt','d.txt','o.txt'};
filet={'bnh4_f.txt','bno2_f.txt','bo_f.txt','nh4_f.txt','no2_f.txt', ...
    'no3_f.txt','p3_f.txt','zoo3_f.txt','d_f.txt','o_f.txt'};

for i=1:num%20 the number of random parameters selected fron specific range
    for j=1:numel(name)
        temp=['/data/gpfs02/sjgao/MogeDu/GLUE2/test1/',num2str(i),'/',char(filet(j))]; 
        filename{1,j}={temp}; %#ok<AGROW>
        fid=fopen([char(name(j)) '.txt'],'wt');
        temp=imsen(char(filename{j}));
        fprintf(fid,'%g\n',temp);
        fclose(fid);
        load(char(file(j)));
        delete(char(file(j)));
    end
    AOO(:,i)=bnh4;
    AOOplot=AOO;
    AOOplot(:,all(isnan(AOOplot)))=[];
    NOO(:,i)=bno2;
    NOOplot=NOO;
    NOOplot(:,all(isnan(NOOplot)))=[];
    BHET(:,i)=bo;
    BHETplot=BHET;
    BHETplot(:,all(isnan(BHETplot)))=[];
    NH4(:,i)=nh4;
    NH4plot=NH4;
    NH4plot(:,all(isnan(NH4plot)))=[];
    NO2(:,i)=no2;
    NO2plot=NO2;
    NO2plot(:,all(isnan(NO2plot)))=[];
    NO3(:,i)=no3;
    NO3plot=NO3;
    NO3plot(:,all(isnan(NO3plot)))=[];
    P(:,i)=p3;
    Pplot=P;
    Pplot(:,all(isnan(Pplot)))=[];
    Z(:,i)=zoo3;
    Zplot=Z;
    Zplot(:,all(isnan(Zplot)))=[];
    D(:,i)=d;
    Dplot=D;
    Dplot(:,all(isnan(Dplot)))=[];
    OXY(:,i)=o;
    OXYplot=OXY;
    OXYplot(:,all(isnan(OXYplot)))=[];
    clear bnh4 bno2 bo nh4 no2 no3 p3 zoo3 d o
end
clear fid file filename i j name temp ans

%for i=1:numel(filet)
%    fn=['I:\EZMGA\EZMresult\',char(filet(i))];
%    importdata(fn);
%end
%bnh4_f=imsen('/home/ncg/MogeDu/GLUE1/base/bnh4_f.txt');
%bnh4=bnh4_f(:,3:63)';
%bnh4=repmat(bnh4,1,num);
%bno2_f=importdata('/home/ncg/MogeDu/GLUE1/base/bno2_f.txt');
%bno2=bno2_f(:,3:63)';
%bno2=repmat(bno2,1,num);
%bo_f=importdata('/home/ncg/MogeDu/GLUE1/base/bo_f.txt');
%bo=bo_f(:,3:63)';
%bo=repmat(bo,1,num);
%nh4_f=importdata('/home/ncg/MogeDu/GLUE1/base/nh4_f.txt');
%nh4=nh4_f(:,3:63)';
%nh4=repmat(nh4,1,num);
no2_f=imsen('/home/ncg/MogeDu/GLUE1/base/no2_f.txt');
%no2=no2_f(:,3:63)';
no2=repmat(no2,1,num);
no3_f=imsen('/home/ncg/MogeDu/GLUE1/base/no3_f.txt');
%no3=no3_f(:,3:63)';
no3=repmat(no3,1,num);
%p3_f=importdata('/home/ncg/MogeDu/GLUE1/base/p3_f.txt');
%p=p3_f(:,3:63)';
%p=repmat(p,1,num);
%zoo3_f=importdata('/home/ncg/MogeDu/GLUE1/base/zoo3_f.txt');
%z=zoo3_f(:,3:63)';
%z=repmat(z,1,num);
%d_f=importdata('/home/ncg/MogeDu/GLUE1/base/d_f.txt');
%d=d_f(:,3:63)';
%d=repmat(d,1,num);
%o_f=importdata('/home/ncg/MogeDu/GLUE1/base/o_f.txt');
%o=o_f(:,3:63)';
%o=repmat(o,1,num);
clear filet no2_f no3_f 
clear  name i fn num
%clear bnh4_f bno2_f bo_f nh4_f d_f p3_f zoo3_f o_f

depth=2:5:300;
depth=depth';
%cal AOO
%AOOsquare=sum((AOO-bnh4).*(AOO-bnh4));
%AOOsquare=AOOsquare./(length(depth));
%AOOCV=sqrt(AOOsquare)./mean(bnh4,1);
%clear AOOsquare

%cal NOO 
%NOOsquare=sum((NOO-bno2).*(NOO-bno2));
%NOOsquare=NOOsquare./(length(depth));
%NOOCV=sqrt(NOOsquare)./mean(bno2,1);
%clear NOOsquare

%cal BHET
BHETsquare=sum((BHET-bo).*(BHET-bo));
BHETsquare=BHETsquare./(length(depth));
BHETCV=sqrt(BHETsquare)./mean(bo,1);
clear BHETsquare

%cal NH4
%NH4square=sum((NH4-nh4).*(NH4-nh4));
%NH4square=NH4square./(length(depth));
%NH4CV=sqrt(NH4square)./mean(nh4,1);
%clear NH4square

%cal NO2
NO2square=sum((NO2-no2).*(NO2-no2));
NO2square=NO2square./(length(depth));
NO2CV=sqrt(NO2square)./mean(no2,1);
clear NO2square

%cal NO3
NO3square=sum((NO3-no3).*(NO3-no3));
NO3square=NO3square./(length(depth));
NO3CV=sqrt(NO3square)./mean(no3,1);
clear NO3square

%cal Phyto
%Psquare=sum((P-p).*(P-p));
%Psquare=Psquare./(length(depth));
%PCV=sqrt(Psquare)./mean(p,1);
%clear Psquare

%cal Zoo
%Zsquare=sum((Z-z).*(Z-z));
%Zsquare=Zsquare./(length(depth));
%ZCV=sqrt(Zsquare)./mean(z,1);
%clear Zsquare

%cal Detritus
%Dsquare=sum((D-d).*(D-d));
%Dsquare=Dsquare./(length(depth));
%DCV=sqrt(Dsquare)./mean(d,1);
%clear Dsquare

%cal DO
%Osquare=sum((OXY-o).*(OXY-o));
%Osquare=Osquare./(length(depth));
%OCV=sqrt(Osquare)./mean(o,1);
%clear Psquare

%TCV=AOOCV+NOOCV+BHETCV ...
%   +NH4CV+NO2CV+NO3CV ...
%    +PCV+ZCV+DCV+OCV;

TCV=NO2CV+NO3CV+BHETCV

%clear AOOCV NOOCV 
clear NO2CV NO3CV BHETCV
%clear PCV ZCV DCV OCV NH4CV

%找出TCV最小的值
TCVMIN=min(TCV(:));
%在屏幕上显示出CV最小值
disp (TCVMIN)
%获取CV最小值所在的行列位置
[row,column]=find(TCV==min(TCV(:)));
%在屏幕上显示出RMSE最小值所处的第row行，第colum列
disp (row)
disp (column)
value=textread(['/data/gpfs02/sjgao/MogeDu/GLUE2/Parameter/',num2str(column),'.txt']); 
str=['the value is',num2str(value)];
disp(str)

%[TCVsort,index]=sort(TCV,'ascend');
%TCVsortindex=cat(1,TCVsort,index);
%select=fix(0.1*numel(TCVsort));
%indexplot=index(:,1:select);
%for i=1:select
%    copyfile(['/home/ncg/MogeDu/GLUE1/Parameter/test1/',num2str(indexplot(i)),'.txt'], ...
%        '/home/ncg/MogeDu/GLUE1/CVana/')
%end
%for i=1:select
%    temp=['/home/ncg/MogeDu/GLUE1/CVana/',num2str(indexplot(i)),'.txt'];
%    data(:,i)={textread(temp)};
%end
%datamat=cell2mat(data);
%CVdata=TCVsortindex(1,1:select);
%clear TCVsort temp 

p=size(datamat,1);
foldername=datestr(date);
path='/home/ncg/MogeDu/GLUE1/CVana/';
mkdir (path,foldername)
pathnew=[path,foldername];
foldername1='Figures';
foldername2='Data';
mkdir (pathnew,foldername1)
mkdir (pathnew,foldername2)
figurepath=[pathnew,'/',foldername1];
datapath=[pathnew,'/',foldername2];
for i=1:p
    figure
    scatter(datamat(i,1:select),CVdata,'filled')
    saveas(gcf,[figurepath,'/',num2str(i),'.fig']);
end
cd(datapath)
save CVanaData.mat
clear pathnew foldername foldername1 foldername2 path figurepath i select

    