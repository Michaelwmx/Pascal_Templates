program link_queue;
type
	node=^queue;
	queue=record
	data:longint;
	next:node;
	end;
	
var t:longint;
	head,q,tail:node;
	com:string;
	
procedure queini();//head node means nothing but front pointer.
var p:node;
begin
	new(p);
	p^.next:=nil;
	head:=p;
	tail:=p;
end;

procedure push(x:longint);//push x 入队
var p:node;
begin
	new(p);
	p^.next:=nil;
	p^.data:=x;
	tail^.next:=p;
	tail:=p;
end;

procedure pop();
var p:node;
begin
	if tail=head then exit;
	p:=head^.next;
	if tail=p then tail:=head;
	head^.next:=p^.next;
	dispose(p);
end;

begin
	queini;
	readln(com);
	while com<>'end' do
	begin
		if copy(com,1,4)='push' then
		begin
			val(copy(com,6,length(com)-5),t);
			push(t);
		end
		else if copy(com,1,3)='pop' then pop;
		if tail=head then writeln('Empty');
		q:=head^.next;
		while q<>nil do
		begin
			writeln(q^.data);
			q:=q^.next;
		end;
		readln(com);
	end;
end.