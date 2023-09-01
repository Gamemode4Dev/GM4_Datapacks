# finds the player head that was placed by the player in water
# @s = player that just placed a furniture player head
# at @s
advancement revoke @s only gm4_furniture:place_furniture_water
say water
scoreboard players set $waterlog gm4_furniture_data 1
function gm4_furniture:place/place_furniture
scoreboard players reset $waterlog gm4_furniture_data
