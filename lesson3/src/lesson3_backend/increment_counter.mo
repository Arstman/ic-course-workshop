import Text "mo:base/Text";
import Nat "mo:base/Nat";

// Create a simple Counter actor.
actor Counter {
  stable var currentValue : Nat = 0;

  // Increment the counter with the increment function.
  public func increment() : async () {
    currentValue += 1;
  };

  // Read the counter value with a get function.
  public query func get() : async Nat {
    currentValue
  };

  // Write an arbitrary value with a set function.
  public func set(n: Nat) : async () {
    currentValue := n;
  };

 type HeaderField = (Text, Text);
 type HttpRequest = {
    url : Text;
    method : Text;
    body : [Nat8];
    headers : [HeaderField];
  };
 type HttpResponse = {
    body : Text;
    headers : [HeaderField];
    status_code : Nat16;
  };
  
  public query func http_request(arg: HttpRequest) : async HttpResponse {
     {
         body=Nat.toText(currentValue);
         headers=[];
         status_code=200;

       }

  };

}
