Factory.define :user do |user|
  user.name                  "example1"
  user.uid                   "123"
  user.provider              "example_prov"  
end

Factory.define :item do |item|
  item.expression             "expr"
  item.translation            "trans"
  item.user                   :user
end