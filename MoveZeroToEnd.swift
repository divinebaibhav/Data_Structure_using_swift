/*
Move all zeroes to end of array

*/
func moveZeroes(_ nums: inout [Int]) {
    // amount of swaps, will be used a as reference for next swap index
    var j = 0 
    
    for (i, e) in nums.enumerated() {
      print("\(i) - \(e)")
      if e != 0 {
            nums.swapAt(j, i) //0 - 2
            j += 1
          print(j)
        }
    }
}
var arr = [0, 0, 5, 6, 0, 1, 2]

moveZeroes(&arr)
print(arr)
//[5, 6, 1, 2, 0, 0, 0]
