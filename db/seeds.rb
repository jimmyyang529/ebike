Item.update( :is_check => false)

category_list =[
  {"category_name" => "公路車"},
  {"category_name" => "登山車"},
  {"category_name" => "女性特仕車"},
  {"category_name" => "兒童車"},
  {"category_name" => "三鐵車"}
]
category_list.each do |category|
  Category.create( :category_name => category["category_name"] )
end


brand_list =[
  {"brand_name" => "捷安特"},
  {"brand_name" => "美利達"},
  {"brand_name" => "其他"}
]
brand_list.each do |brand|
  Brand.create( :brand_name => brand["brand_name"] )
end
