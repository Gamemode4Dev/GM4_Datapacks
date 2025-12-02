# run the function belonging to the placed furniture
# @s = player that just placed a furniture player head
# at the center of the furniture player head that was placed
# run from place/prep_place
# with {furniture_id}

$execute if score $rotation gm4_furniture_data matches 1 rotated 0 0 run function gm4_furniture:place/furniture/$(furniture_id)
$execute if score $rotation gm4_furniture_data matches 2 rotated 90 0 run function gm4_furniture:place/furniture/$(furniture_id)
$execute if score $rotation gm4_furniture_data matches 3 rotated 180 0 run function gm4_furniture:place/furniture/$(furniture_id)
$execute if score $rotation gm4_furniture_data matches 4 rotated -90 0 run function gm4_furniture:place/furniture/$(furniture_id)
