//Given an array of integers arr[] of size N and an integer, the task is to rotate the array elements to the left by d positions.
/*
Input: 
arr[] = {1, 2, 3, 4, 5, 6, 7}, d = 2
Output: 3 4 5 6 7 1 2

Input: arr[] = {3, 4, 5, 6, 7, 1, 2}, d=2
Output: 5 6 7 1 2 3 4

*/

func solutionByTimes(times: Int, arr: [Int]) -> [Int] {
  
   var tempArray = arr  
  
  var d = times
  
    while d > 0 {
         tempArray = rotateOnce(arr: tempArray)
         d = d - 1
     }
  return tempArray
}

func rotateOnce(arr: [Int] ) -> [Int] {
  
  var arrTemp = [Int](repeating: 0, count: arr.count)
    
     for i in 0..<arrTemp.count - 1 {
          arrTemp[i] = arr[i + 1]
     }
     arrTemp[arrTemp.count - 1] = arr[0]
    
  return arrTemp
}

//let arr = [1, 2, 3, 4, 5, 6, 7]
let arr = [3, 4, 5, 6, 7, 1, 2]

print(solutionByTimes(times: 2, arr: arr))
