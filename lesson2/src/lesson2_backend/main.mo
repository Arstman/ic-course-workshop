import Array "mo:base/Array";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
actor {
    func quicksort(arr:[Int]) : [Int] {
        var newArr:[var Int] = Array.thaw(arr);
        quicksort(newArr,0,newArr.size()-1);
        Array.freeze(newArr)
    };
// the sorting func
    func sort(arr:[var Int],low:Nat,high:Nat){
        if(low>=high) return;
        var temp = arr[low];
        var left = low;
        var right = high;
        while(left < right){
            while(arr[right] >= temp and right > left){
                right -= 1;
            };
            arr[left] := arr[right];
            while(arr[left] <= temp and left < right){
                left += 1;
            };
            arr[right] := arr[left];
        };
        arr[right] := temp;
        if(left >= 1) sort(arr,low,left-1);
        sort(arr,left+1,high);
    };
// the public for frontend to call
    public func qsort(arr:[Int]) : async [Int] {
        quicksort(arr)
    };
};

