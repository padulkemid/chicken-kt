fun reverse(input: String): String {
    var reversed = ""
    
    for (i in input.length - 1 downTo 0) {
        reversed += input[i]
    }

    return reversed
}
