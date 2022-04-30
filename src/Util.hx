class Util {
    public static function print(data:String) {
        #if js
            js.Browser.console.log(data);
        #else
            Sys.println(data);
        #end
    }
    public static function getLang():String {
        #if interp
           return 'HaxeEval';
        #elseif cppia
            return "Cppia";
        #elseif cpp
            return "C++";
        #elseif python
            return "Python";
        #elseif lua
            return "Lua";
        #elseif php
            return "PHP";
        #elseif cs
            return "C#";
        #elseif jvm
            return "JavaBytecode";
        #elseif java
            return "Java";
        #elseif neko
            return "Neko";
        #elseif js
            return "Javascript";
        #elseif flash
            return "Flash/AS3";
        #elseif hl
            return "Hashlink";
        #else 
            return "UnknownTarget";
        #end
    }
}