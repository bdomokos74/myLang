Factory.define :user do |user|
  user.name                  "example1"
  user.uid                   "123"
  user.provider              "example_prov"  
end

Factory.define :other_user, :class => User do |user|
  user.name                  "example2"
  user.uid                   "456"
  user.provider              "example_prov"  
end

Factory.define :item1, :class => Item do |item|  
  item.expression             "one"
  item.translation            "uno/una"  
end
Factory.define :item2, :class => Item  do |item|
  item.expression             "two"
  item.translation            "dos"    
end
Factory.define :item3, :class => Item do |item|
  item.expression             "three"
  item.translation            "tres"  
end
Factory.define :item4, :class => Item  do |item|
  item.expression             "four"
  item.translation            "cuatro"    
end
Factory.define :item5, :class => Item do |item|
  item.expression             "five"
  item.translation            "cinco"  
end
Factory.define :item6, :class => Item  do |item|
  item.expression             "six"
  item.translation            "seis"    
end
Factory.define :item7, :class => Item do |item|
  item.expression             "seven"
  item.translation            "siete"  
end
Factory.define :item8, :class => Item  do |item|
  item.expression             "eight"
  item.translation            "ocho"    
end
Factory.define :item9, :class => Item do |item|
  item.expression             "nine"
  item.translation            "nueve"  
end
Factory.define :item10, :class => Item  do |item|
  item.expression             "ten"
  item.translation            "diez"    
end



Factory.define :other_item1, :class => Item  do |item|
  item.expression             "three"
  item.translation            "tres"  
end