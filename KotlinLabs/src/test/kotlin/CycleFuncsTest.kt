import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class CycleFuncsKtTest {

    @Test
    fun findMinDigit() {
        val main = CycleFuncs()
        val expected = 1
        assertEquals(expected, main.findMinDigit(3162))
    }

    @Test
    fun digitsLessThan3() {
        val main = CycleFuncs()
        val expected = 2
        assertEquals(expected, main.digitsLessThan3(3162))
    }

    @Test
    fun dividers() {
        val main = CycleFuncs()
        val expected = 2
        assertEquals(expected, main.dividers(23))
    }
}