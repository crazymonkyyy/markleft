import std.stdio;
import std.algorithm;
import std.array;
void main(string[] s){
	auto input=File(s[1]~".ml");
	auto output=File(s[1],"w");
	char[] bracketstore;
	bool notsimple;
	foreach(o;input.byChunk(1)){
		assert(bracketstore.length<4);
		notsimple=o=='[' || o== ']';
		if(bracketstore=="[[]"){
			output.write('[');
			bracketstore="";
			break;
		}
		if(bracketstore=="[]]"){
			output.write(']');
			bracketstore="";
			break;
		}
				//output.write(c);
	}
}