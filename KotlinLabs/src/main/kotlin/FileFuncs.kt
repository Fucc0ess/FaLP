import java.io.File

fun main(args: Array<String>) {
    // Читаем входной файл
    val inputFile = File("input.txt")

    // Проверяем, существует ли входной файл
    if (!inputFile.exists()) {
        println("Входной файл не найден!")
        return
    }

    val outputFile = File("output.txt")

    val rec = RecursiveFuncs()

    // Открываем входной файл для чтения и выходной файл для записи
    val inputLines = inputFile.readLines()
    val outputLines = mutableListOf<String>()

    for (line in inputLines) {
        val parts = line.split(" ")
        if (parts.size != 2) {
            println("Некорректная строка: $line")
            continue
        }

        val number = parts[0].toIntOrNull()
        val functionName = parts[1]

        if (number == null) {
            println("Некорректное число: ${parts[0]}")
            continue
        }

        // Вызываем соответствующую функцию и записываем результат
        val result = when (functionName) {
            "findMinDigit" -> rec.findMinDigit(number)
            "findMinDigitTailRec" -> rec.findMinDigitTailRec(number)
            "digitsLessThan3" -> rec.digitsLessThan3(number)
            "digitsLessThan3TailRec" -> rec.digitsLessThan3TailRec(number)
            "dividers" -> rec.dividers(number)
            "dividersTailRec" -> rec.dividersTailRec(number)
            else -> {
                println("Неизвестная функция: $functionName")
                continue
            }
        }

        outputLines.add("$result $functionName")
    }

    // Записываем результаты в выходной файл
    outputFile.writeText(outputLines.joinToString("\n"))

    println("Файл сохранён как ${outputFile.absolutePath}")
}
