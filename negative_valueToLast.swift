
func putNegativeToLast(_ nums: inout [Int]) {

  var j = 0
  for (index, value) in nums.enumerated() {
      if value > 0 {
        nums.swapAt(index, j)
        j = j + 1
      }
  }
 
  
}
var arr = [1, -2, 2, -1, -5]

putNegativeToLast(&arr)
print(arr)
//[1, 2, -2, -1, -5]
