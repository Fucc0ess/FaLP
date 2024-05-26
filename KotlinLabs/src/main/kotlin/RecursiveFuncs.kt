import kotlin.math.abs;
import kotlin.math.max
import kotlin.math.min

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
        return if (absnum < 10) {
            if (absnum < 3) count + 1 else count
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
        val absnum = abs(number)
        return if (absnum == 0) 0 else if (divider == absnum) {
            1
        }
        else {
            val countRest = dividers(absnum, divider + 1)
            if (absnum % divider == 0) countRest + 1 else countRest
        }
    }
    // Рекурсия вниз
    tailrec fun dividersTailRec(number: Int, divider: Int = 1, count: Int = 0): Int {
        val absnum = abs(number)
        return if (absnum == 0) 0 else if (divider == absnum) {
            count + 1
        }
        else {
            val curCount = if (absnum % divider == 0) count + 1 else count
            dividersTailRec(absnum, divider + 1, curCount)
        }
    }

    /**
     * Функция высших порядков для нахождения максимума среди значений переданной функции от чисел в списке
     */
    fun findMax(numbers: List<Int>, callbackFun: (Int) -> Int): Int {
        return findMax(numbers, callbackFun, 0, callbackFun(numbers[0]))
    }

    /**
     * Хвостовая рекурсия функции высших порядков для нахождения максимума
     */
    private tailrec fun findMax(numbers: List<Int>, callbackFun: (Int) -> Int, index: Int, max: Int): Int {
        if (index == numbers.size)
            return max

        val callbackValue = callbackFun(numbers[index])
        val newMax = if (max > callbackValue) max else callbackValue

        return findMax(numbers, callbackFun,index + 1, newMax)
    }

    /**
     * Сумма непростых делителей числа
     */
    tailrec fun primeDividersSum(number: Int, divider: Int = 2, sum: Int = 0): Int {
        val absnum = abs(number)
        return if (divider > absnum / 2) {
            sum
        }
        else {
            var newSum = sum
            if ((absnum % divider == 0) and (dividersTailRec(divider) > 2)) {
                 newSum += divider
            }
            primeDividersSum(absnum, divider + 1, newSum)
        }
    }

    /**
     * Количество чисел, не являющихся делителями исходного числа, не взамнопростых с ним и взаимно простых с суммой простых цифр этого числа
     */
    tailrec fun complexFuncFor7(number: Int, curNum: Int = 2, count: Int = 0): Int {
        val absnum = abs(number)
        return if (curNum == absnum) {
            count
        }
        else {
            val sumCifr = primeDigitsSum(absnum)
            var curCount = count
            if ((absnum % curNum != 0) and (!twoWayPrime(absnum, curNum)) and (twoWayPrime(sumCifr, curNum))) {
                curCount += 1
            }
            complexFuncFor7(absnum, curNum + 1, curCount)
        }
    }
    // Проверка на взаимную простоту
    tailrec fun twoWayPrime(number1: Int, number2: Int, divider: Int = 2): Boolean {
        val max = if (number1 >= number2) number1 else number2
        val min = if (number1 < number2) number1 else number2
        return if (divider == min) {
            max % min != 0
        }
        else {
            if ((number1 % divider == 0) and (number2 % divider == 0)){
                false
            }
            else {
                twoWayPrime(number1, number2, divider + 1)
            }
        }
    }
    // Сумма простых цифр
    tailrec fun primeDigitsSum(number: Int, sum: Int = 0): Int {
        val absnum = abs(number)
        return if (absnum < 10) {
            if (dividers(absnum) == 2) {
                sum + absnum
            }
            else {
                sum
            }
        }
        else {
            val digit = absnum % 10
            var newSum = sum
            if (dividers(digit) == 2) {
                newSum += digit
            }
            primeDigitsSum(absnum / 10, newSum)
        }
    }
}

fun main() {
    val rec = RecursiveFuncs()
    println(rec.findMinDigit(-123))
    println(rec.findMinDigitTailRec(-123))
    println(rec.digitsLessThan3(-123))
    println(rec.digitsLessThan3TailRec(-123))
    println(rec.dividers(-12))
    println(rec.dividersTailRec(-12))
    println(rec.primeDividersSum(12))
    println(rec.complexFuncFor7(15))
}