println("choose operation")
println("1. +")
println("2. -")
println("3. *")
println("4. /")
print("user input: ")
operation = strip(readline())

if operation == "1"
    symbol = "+"
elseif operation == "2"
    symbol = "-"
elseif operation == "3"
    symbol = "*"
else
    operation == "4"
    symbol = "/"
end
println("select number 1")
print("user input: ")
number_1_string = readline()
number_1 = parse(Int, number_1_string)

println("select number 2")
print("user input: ")
number_2_string = readline()
number_2 = parse(Int, number_2_string)

answer = 0.0

if operation == "1"
    answer = number_1 + number_2
elseif operation == "2"
    answer = number_1 - number_2
elseif operation == "3"
    answer = number_1 * number_2
elseif operation == "4"
    if number_2_string == "0"
        impossible = "12"
        println("ERROR: cannot divide by 0")
    else
        answer = number_1 / number_2
    end
end

if impossible == "12"
    println("Impossible operation, restart program")
else
    println("$number_1 $symbol $number_2 = $answer")
end