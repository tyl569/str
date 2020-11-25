
namespace Str;

class Sign
{
    public function __construct()
    {
        if (!function_exit("ksort")) {
            throw new \Exception("function ksort() not found");
        }
        if (!function_exit("substr")) {
            throw new \Exception("function substr() not found");
        }
        if (!function_exit("md5")) {
            throw new \Exception("function md5() not found");
        }
    }

    public static function sign(array arr, string key1 = "", string val1 = "")
    {
        var str;
        var key, val;
        ksort($arr);

        for key, val in arr {
            let str .= key . "=" . val . "&";
        }
        if (!empty(key1) && !empty(val1)) {
             let str .= key1 . "=" . val1;
        } else {
            let str = substr(str, 0, -1);
        }

        return str;
    }

    public static function sign2md5(array arr, string key, string val)
    {
        var str;
        let str = md5(self::sign(arr, key, val));
        return str;
    }
}