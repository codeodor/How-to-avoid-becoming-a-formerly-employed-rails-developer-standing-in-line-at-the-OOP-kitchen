require 'test_helper'

class EnumerationTest < ActiveSupport::TestCase
  test "Enumeration.const_missing" do
    Enumeration.add_item("a", {:id=> 1, :name=>"a"})
    assert !Enumeration.const_missing("b")
    assert Enumeration.const_missing("a")
  end
  
  test "Enumeration.each" do 
    Enumeration.add_item("a", {:id=> 1, :name=>"a"})
    Enumeration.add_item("b", {:id=> 2, :name=>"b"})
    Enumeration.each do |k, v|
      assert v[:id] = 1 if k == "a" 
      assert v[:id] = 2 if k == "b"
    end 
  end
  
  test "Enumeration.keys and Enumeration.values" do 
    Enumeration.add_item("a", {:id=> 1, :name=>"a"})
    Enumeration.add_item("b", {:id=> 2, :name=>"b"})
    assert Enumeration.keys.include? "a"
    assert Enumeration.values.include?({:id=> 1, :name=> "a"})
  end
  
  test "Enumration.key_select" do
    Enumeration.add_item("a", {:id=> 1, :name=>"a"})
    Enumeration.add_item("b", {:id=> 2, :name=>"b"})
    assert !Enumeration.key_select.nil?
  end
end
