print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    let isArithmetic : Bool = Int(args[args.count - 1]) == nil ? false : true;
    var output: Int = 0
    if(isArithmetic){
        let oprator = args[1]
        switch oprator {
        case "+" : output = Int(args[0])! + Int(args[2])!
        case "-": output = Int(args[0])! - Int(args[2])!
        case "*": output = Int(args[0])! * Int(args[2])!
        case "/": output = Int(args[0])! / Int(args[2])!
        case "%": output = Int(args[0])! % Int(args[2])!
        default: return output
        }
    }
    else if (args[0] == "avg" || args[0] == "count" || args[0] == "fact"){
        output = 0
    }
    else if (args[args.count - 1] == "count"){
        output = args.count - 1
    }
    else if (args[args.count - 1]  ==  "avg"){
        var sum: Int = 0
        for index in 0...args.count - 2{
            sum += Int(args[index])!
        }
        output = sum / (args.count - 1)
    }
    else if (args[args.count - 1] == "fact"){
        if(Int(args[0]) != 0){
            var total: Int = 1
            for index in 1...Int(args[0])!{
                total *= index
            }
            output = total
        } else {
            output = 1
        }
        
    }
    return output
}

func calculate(_ arg: String) -> Int {
    return calculate(arg.split(separator: " ").map({substring in String(substring)}))
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculate(_ args: [String]) -> Double {
    let isArithmetic : Bool = Double(args[args.count - 1]) == nil ? false : true;
    var output: Double = 0.0
    if(isArithmetic){
        let oprator = args[1]
        switch oprator {
        case "+" : output = Double(args[0])! + Double(args[2])!
        case "-": output = Double(args[0])! - Double(args[2])!
        case "*": output = Double(args[0])! * Double(args[2])!
        case "/": output = Double(args[0])! / Double(args[2])!
        case "%": output = Double(args[0])!.truncatingRemainder(dividingBy: Double(args[2])!)
        default: return output
        }
    }
    else if (args[0] == "avg" || args[0] == "count" || args[0] == "fact"){
        output = 0
    }
    else if (args[args.count - 1] == "count"){
        output = Double(args.count - 1)
    }
    else if (args[args.count - 1]  ==  "avg"){
        var sum: Double = 0
        for index in 0...args.count - 2{
            sum += Double(args[index])!
        }
        output = sum / Double(args.count - 1)
    }
    else if (args[args.count - 1] == "fact"){
        if(Double(args[0]) != 0){
            var total: Double = 1
            for index in 1...Int(args[0])!{
                total *= Double(index)
            }
            output = total
        } else {
            output = 1
        }
        
    }
    return output
}

func calculate(_ arg: String) -> Double {
    return calculate(arg.split(separator: " ").map({substring in String(substring)}))
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5

