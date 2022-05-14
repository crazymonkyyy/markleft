import basic;
bool isalpha(char c){
	if(c=='['){return false;}
	if(c==']'){return false;}
	if(c=='\n'){return false;}
	return true;
}
bool isleft(char c){
	return c=='[';}
bool isright(char c){
	return c==']';}
bool isend(char c){
	return c=='\n';}
void main(string[] s){
	string file=File(s[1]).byLine.joiner("\n").array.to!string;
	struct iter{
		int i;
		char get(){
			if(i<0||i>=file.length){return '\n';}
			return file[i];
		}
		alias get this;
		void opUnary(string s:"++")(){
			i++;
		}
		auto opUnary(string s:"*")(){
			return i;
		}
	}
	struct pair{int a; int b;}
	pair[] o;
	iter old=iter(0);
	iter cur=iter(0);
	iter look=iter(1);
	void addspilt(){
		o~=pair(*old,*cur);
		old=look;
	}
	bool done(){
		return *cur>=file.length;
	}
	goto inner;
	loop:
		++cur;
		++look;
	inner:
		if(old.isend){
			if(done){goto end;}
			addspilt;
			goto loop;
		}
		if(old.isalpha){
			if( ! look.isalpha){
				addspilt;
				goto loop;
		}}
		if(*old==*cur){goto loop;}
		if(old.isleft){
			if(cur.isright){
				if(look.isright){ goto loop;}
				addspilt;
				goto loop;
			}
			if(cur.isleft){
				if(look.isright){goto loop;}
				assert(0,"unbalenced [[");
			}
		}
		if(old.isright){
			if(cur.isleft){
				addspilt;
				goto loop;
			if(cur.isright){
				assert(0,"unbalenced ]]");
			}
		}}
	goto loop;
	end:
	foreach(e;o){
		string a=file[e.a..e.b+1];
		if(a=="\n"){"endline".writeln;}
		else{a.writeln;}
	}
}