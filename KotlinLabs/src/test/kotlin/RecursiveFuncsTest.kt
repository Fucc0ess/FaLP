import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class RecursiveFuncsKtTest {

    @Test
    fun findMinDigit() {
        val main = RecursiveFuncs()
        val expected = 1
        assertEquals(expected, main.findMinDigit(-3162))
    }

    @Test
    fun findMinDigitTailRec() {
        val main = RecursiveFuncs()
        val expected = 1
        assertEquals(expected, main.findMinDigitTailRec(-3162))
    }

    @Test
    fun digitsLessThan3() {
        val main = RecursiveFuncs()
        val expected = 2
        assertEquals(expected, main.digitsLessThan3(-3162))
    }

    @Test
    fun digitsLessThan3TailRec() {
        val main = RecursiveFuncs()
        val expected = 2
        assertEquals(expected, main.digitsLessThan3TailRec(-3162))
    }

    @Test
    fun dividers() {
        val main = RecursiveFuncs()
        val expected = 6
        assertEquals(expected, main.dividers(-12))
    }

    @Test
    fun dividersTailRec() {
        val main = RecursiveFuncs()
        val expected = 6
        assertEquals(expected, main.dividersTailRec(-12))
    }
}