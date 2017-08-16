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


# item_list =[
# 	{"category_id"=>"1","brand_id"=>"1", "name" => "FASTROAD_FASTROAD SLR","img_url" =>"http://www.giantcyclingworld.com/backend/?p_action_name=get-file&id=20036832","manufacture_year"=>"2017","frame"=>"","fork"=>"","size"=>"","color"=>"","price"=>"","description"=""},
#
#
# ]
# item_list.each do |item|
#   Item.create( :title => item["title"],  :due_date => item["due_date"])
# end
