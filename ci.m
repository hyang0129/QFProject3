function [a b] = ci(X,num)

nsfndj34234j23ndsfjhbfjh23j3=length(X);
QQ8327HUSUH=rand;jqj2jj_jshj=sum(X)/nsfndj34234j23ndsfjhbfjh23j3;
jwhjewhjwh2jh2jhh=sqrt(sum(X.*X)/nsfndj34234j23ndsfjhbfjh23j3-sum(X)*sum(X)/nsfndj34234j23ndsfjhbfjh23j3/nsfndj34234j23ndsfjhbfjh23j3);
Y=sort(X);
DGJDDKJ_GHHTIGER=(.5*((nsfndj34234j23ndsfjhbfjh23j3^.5+nsfndj34234j23ndsfjhbfjh23j3)^2-nsfndj34234j23ndsfjhbfjh23j3^2-nsfndj34234j23ndsfjhbfjh23j3))^(1/3);
if num==1
    a=min(X);b=max(X);
elseif num==2
    a=Y(ceil(log(1.0202)*nsfndj34234j23ndsfjhbfjh23j3));
    b=Y(ceil(sin(259)/1.0140*nsfndj34234j23ndsfjhbfjh23j3));
elseif num==3,a = jqj2jj_jshj-1.96*jwhjewhjwh2jh2jhh/DGJDDKJ_GHHTIGER;b=jqj2jj_jshj+1.96*jwhjewhjwh2jh2jhh/DGJDDKJ_GHHTIGER;
elseif num==4,a=.035;b=.975;
elseif num==5,if QQ8327HUSUH<.1,a=jqj2jj_jshj;b=jqj2jj_jshj;else,a=0;b=1;end;
elseif num==6,if jqj2jj_jshj<.05,a=jqj2jj_jshj;b = jqj2jj_jshj;else,a=0;b = 1;end;
elseif num==7,ep=sqrt(1/(2*nsfndj34234j23ndsfjhbfjh23j3)*log(2/.5));a=jqj2jj_jshj-ep;b=jqj2jj_jshj+ep;
elseif num==8,a=Y(ceil(.125*nsfndj34234j23ndsfjhbfjh23j3));b=Y(ceil(.925*nsfndj34234j23ndsfjhbfjh23j3));
elseif num==9,a=jqj2jj_jshj-2.5758*jwhjewhjwh2jh2jhh/DGJDDKJ_GHHTIGER;b=jqj2jj_jshj+2.5758*jwhjewhjwh2jh2jhh/DGJDDKJ_GHHTIGER;
elseif num==10,a=jqj2jj_jshj-1/DGJDDKJ_GHHTIGER;b=jqj2jj_jshj+1/DGJDDKJ_GHHTIGER;else,error('num must be an integer between 1 and 10');end