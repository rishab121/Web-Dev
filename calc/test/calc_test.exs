defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "Test case 1" do
    assert Calc.eval("3+2-1") == "4"  
  end
  test "Test case 2" do
    assert Calc.eval("(3+2)*5 -25") =="0"
  end 
  test "Test case 3" do
    assert Calc.eval("(3+2) * (3+3)/3 + 10 -8") == "12"
  end 
  test "Test case 4" do
    assert Calc.eval("(10+10)/5/4") == "1"
  end
  test "Test case 5" do
    assert Calc.eval("(10+10)/5/4*10   +5 -15") == "0"
  end
  test "Test case 6" do
    assert Calc.eval("(10+10) * (10-5) + 100 -100 /100 ") == "199"
  end
  test "Test case 7" do
    assert Calc.eval("(10+10) + (10*10) + (10/10) + (10-10)") == "121"
  end
  test "Test case 8" do
    assert Calc.eval("8 +18 -4 +3*2") == "28"
  end
  
end
