 -  @nonescaping closure

/*
by default @nonescaping closure
When passing a closure as the function argument, the closure gets execute with the function’s body and returns the compiler back. As the execution ends, the passed closure goes out of scope and have no more existence in memory.
*/
let arr = [0, 1, 0, 2, 2, 1, 2,0, 0, 2, 0, 1, 1, 0 ,2]

func func_nonesc(arr: [Int], onComplition: (Int)->()) {
  var sum = 0
  for i in 0..<arr.count {
    sum = sum + arr[i]
  }
  onComplition(sum)
}

func_nonesc(arr: arr) {  sum in
  print(sum) //14
}

//So we are not escaping the execution of the closure.

 -  @escaping closure

import Foundation

let arr = [0, 1, 0, 2, 2, 1, 2,0, 0, 2, 0, 1, 1, 0 ,2]

func func_nonesc(arr: [Int], onComplition: @escaping (Int)->()) {
  var sum = 0
  for i in 0..<arr.count {
    sum = sum + arr[i]
  }

    let seconds = 0.2
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        onComplition(sum)
    }   
  
}

func_nonesc(arr: arr){  sum in
  print(sum)
}
