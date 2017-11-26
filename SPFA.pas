program SPFA;
const maxn=10000;
    maxm=500000;

type edge=record
    v:Int64;//value
    next:longint;//next
    node:longint;//to
    end;

var n,m,p,i,f,g,w,tot:longint;
    e:array[1..maxm]of edge;
    dist,head:array[1..maxn]of longint;
    que:array[1..maxm]of longint;
    flag:array[1..maxn]of boolean;

procedure add(x,y,z:longint);
begin
    inc(tot);
    e[tot].v:=z;
    e[tot].next:=head[x];
    e[tot].node:=y;
    head[x]:=tot;
end;

procedure spfa(p:longint);
var h,t,v,q:longint;
    tem:Int64;
begin
    filldword(dist,n,maxlongint);
    fillchar(flag,n,false);
    h:=1;t:=1;
    que[1]:=p;
    dist[p]:=0;
    flag[p]:=true;
    while h<=t do
    begin
        v:=que[h];
        flag[v]:=false;
        inc(h);
        q:=head[v];
        while q<>0 do
        begin
            tem:=dist[v]+e[q].v;
            if tem<dist[e[q].node] then
            begin
                dist[e[q].node]:=tem;
                if not(flag[e[q].node]) then begin
                    inc(t);
                    que[t]:=e[q].node;
                    flag[e[q].node]:=true;
                end;
            end;
            q:=e[q].next;
        end;
    end;
end;

begin
    readln(n,m,p);
    tot:=0;
    filldword(head,n,0);
    for i:=1 to m do
    begin
        readln(f,g,w);
        add(f,g,w);
    end;
    spfa(p);
    for i:=1 to n do
    write(dist[i],' ');
end.
