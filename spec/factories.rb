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

Factory.define :other_item1, :class => Item  do |item|
  item.expression             "three"
  item.translation            "tres"  
end