import haxe.Timer;
import haxe.ValueException;
import haxe.exceptions.ArgumentException;

class PrimeSieve {
    var sieveSize:Int;
    var rawbits:Array<Bool>;
    var primeCounts:Map<Int,Int> = [
        10 => 4,
        100 => 25,
        1000 => 168,
        10000 => 1229,
        100000 => 9592,
        1000000 => 78498,
        10000000 => 664579,
        100000000 => 5761455
    ];

    public function new(limit:Int):Void {
        sieveSize = limit;
        rawbits = [for (i in 0...Std.int((limit+1)/2)) true];
    }

    function ValidateResults():Bool {
        if (primeCounts[sieveSize] != null) return primeCounts[sieveSize] == countPrimes()
        else return false;
    }

    function GetBit(index:Int):Bool {
        if (index % 2 == 0) return false;
        else return rawbits[Std.int(index/2)];
    }

    function clearBit(index:Int):Void {
        if (index % 2 == 0) throw new ArgumentException("index","If you're setting even bits, you're sub-optimal for some reason!");
        else rawbits[Std.int(index/2)] = false;
    }

    public function runSieve():Void {
        var factor = 3;
        var q = Math.sqrt(sieveSize);

        while (factor < q) {
            for (num in factor...sieveSize) {
                if (GetBit(num)) {
                    factor = num;
                    break;
                }
            }

            var num = factor * 3;
            while (num < sieveSize) {
                num += factor * 2;
                clearBit(num);
            }
            factor += 2;
        }
    }

	function countPrimes():Int {
		return rawbits.filter((b) -> b).length;
	}
}

class Main {
    static public function main():Void {
        var tStart:Float = Timer.stamp();
        var passes:Int = 0;
        var sieve:PrimeSieve = null;
        while (Timer.stamp() - tStart < 5) {
            sieve = new PrimeSieve(1000000);
            sieve.runSieve();
            passes += 1;
        }
        var tD:Float = Timer.stamp() - tStart;
        
        Util.print("TayIorRobinson_Haxe_" + Util.getLang() + ";" + Std.string(passes) + ";" + Std.string(tD) + ";1;algorithm=base,faithful=yes");
    }
}