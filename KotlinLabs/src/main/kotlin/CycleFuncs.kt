import java.util.*

class CycleFuncs {

    //Найти минимальную цифру в числе/
    fun findMinDigit(number: Int): Int {
        var minDigit = 9
        var temp = number
        while (temp > 0) {
            val digit = temp % 10
            if (digit < minDigit) {
                minDigit = digit
            }
            temp /= 10
        }
        return minDigit
    }

    //Количество цифр числа, меньших 3
    fun digitsLessThan3(number: Int): Int {
        var n = 0
        var temp = number
        while (temp > 0) {
            val digit = temp % 10
            if (digit < 3) {
                n += 1
            }
            temp /= 10
        }
        return n
    }

    //Количество делителей числа
    fun dividers(number: Int): Int {
        var temp = number
        var curDel = 2
        var n = 2
        while (curDel != temp/2) {
            if (temp % curDel == 0){
                n += 1
            }
            curDel += 1
        }
        return n
    }
}