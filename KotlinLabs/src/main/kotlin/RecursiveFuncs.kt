import java.math.BigInteger
import kotlin.math.abs;

class RecursiveFuncs {

    /**
     * Нахождение минимальной цифры числа
     */
    // Рекурсия вверх
    fun findMinDigit(number: Int): Int {
        val absnum = abs(number)
        return if (absnum < 10) {
            absnum
        }
        else {
            val digit = absnum % 10
            val minInRest = findMinDigit(absnum / 10)
            if (digit < minInRest) digit else minInRest
        }
    }
    // Рекурсия вниз
    tailrec fun findMinDigitTailRec(number: Int, minDigit: Int? = null): Int {
        val absnum = abs(number)
        return if (absnum == 0) {
            minDigit ?: absnum
        }
        else {
            val digit = absnum % 10
            var newMinDigit = digit
            if (minDigit != null) {
                newMinDigit = if (digit < minDigit) digit else minDigit
            }

            findMinDigitTailRec(absnum / 10, newMinDigit)
        }
    }

    /**
     Количество цифр числа, меньших 3
     */
    // Рекурсия вверх
    fun digitsLessThan3(number: Int): Int {
        val absnum = abs(number)
        return if (absnum < 10){
            if (absnum < 3) 1 else 0
        }
        else {
            val digit = absnum % 10
            val countRest = digitsLessThan3(absnum / 10)
            if (digit < 3) countRest + 1 else countRest
        }
    }
    // Рекурсия вниз
    tailrec fun digitsLessThan3TailRec(number: Int, count: Int = 0): Int {
        val absnum = abs(number)
        return if (absnum == 0) {
            count
        }
        else {
            val digit = absnum % 10
            val curCount = if (digit < 3) count + 1 else count
            digitsLessThan3TailRec(absnum/10, curCount)
        }
    }

    /**
     * Количество делителей числа
     */
    // Рекурсия вверх
    fun dividers(number: Int, divider: Int = 1): Int {
        return if (divider == number) {
            1
        }
        else {
            val countRest = dividers(number, divider + 1)
            if (number % divider == 0) countRest + 1 else countRest
        }
    }
    // Рекурсия вниз
    tailrec fun dividersTailRec(number: Int, divider: Int = 1, count: Int = 0): Int {
        return if (divider == number) {
            count + 1
        }
        else {
            val curCount = if (number % divider == 0) count + 1 else count
            dividersTailRec(number, divider + 1, curCount)
        }
    }
}

fun main() {
    val rec = RecursiveFuncs()
    println(rec.dividers(12))
    println(rec.dividersTailRec(12))
}