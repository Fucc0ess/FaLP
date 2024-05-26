import java.util.*
import kotlin.math.abs

class CycleFuncs {

    //Найти минимальную цифру в числе/
    fun findMinDigit(number: Int): Int {
        var absnum = abs(number)
        var minDigit = 9
        while (absnum > 0) {
            val digit = absnum % 10
            if (digit < minDigit) {
                minDigit = digit
            }
            absnum /= 10
        }
        return minDigit
    }

    //Количество цифр числа, меньших 3
    fun digitsLessThan3(number: Int): Int {
        var absnum = abs(number)
        var n = 0
        while (absnum > 0) {
            val digit = absnum % 10
            if (digit < 3) {
                n += 1
            }
            absnum /= 10
        }
        return n
    }

    //Количество делителей числа
    fun dividers(number: Int): Int {
        var absnum = abs(number)
        var curDel = 2
        var n = 2
        while (curDel <= absnum/2) {
            if (absnum % curDel == 0){
                n += 1
            }
            curDel += 1
        }
        return n
    }
}