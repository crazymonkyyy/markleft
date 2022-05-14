struct tokenizer(alias F,alias Fdeffaults){
	string me;
	int processed=-1;
	int index=0;
	char opIndex(int i){
		i+=index;
		if(i<=processed){
			return ' ';
		}
		if(i>=me.length){
			return ' ';
		}
		return me[i];
	}
	auto indexacess(){
		struct access{
			tokenizer!(F,Fdeffaults)* parent;
			char opIndex(int i){
				return (*parent)[i];
			}
			auto get(){return this[0];}
			alias get this;
		}
		return access(&this);
	}
	import std.traits;
	Parameters!(F!Error)[1..$] para=Fdeffaults;
	alias E=ReturnType!(F!Error);
	import std.typecons;
	alias O=Tuple!(string, E);
	O front=O("",cast(E)0);
	void popFront(){
		E e;
		l:
		index++;
		e=F(indexacess,para);
		if(e==cast(E)0 && index<me.length){
			goto l;
		}
		import std.algorithm;
		front=O(me[processed+1..min(index+1,$)],e);
		processed=index;
	}
	bool empty(){
		return index >= me.length;
	}
}
unittest{
	import std;
	enum e{no,foo,bar}
	static e foobar(T)(T c,ref int i){
		static if(is(T==Error)){return e.no;}
		else{
		i++;
		if(true){
			if(c[-2]=='f'&&c[-1]=='o'&&c=='o'){
				return e.foo;
			}
			if(c[-2]=='b'&&c[-1]=='a'&&c=='r'){
				return e.bar;
			}
			i=0;
		}
		return e.no;
	}}
	auto a=tokenizer!(foobar,AliasSeq!(0))("foobarfoobarfoofoofoo");
	foreach(s,b;a){
		//writeln(s," ",b);
	}
}
enum token{no,emptymeta,metatag,reset,style,words}
emun markleftdefualts=AliasSeq!()
enum state{words,tags}
token markleft(T)(T c,ref state s){
	if(c[-1]=='['&&(c=='['||c==']')&&c[1]==']'){
		return toke.no;
	}
	if(s.words){
		if(c[1]=='['||c[1]==']'){
			return token.words;
		}
		if(c=='['){
			