# @s = player who reeled in the armor stand
# run from advancement "reel_rod"

advancement revoke @s only gm4_end_fishing:reel_rod
execute if entity @s[gamemode=!creative,nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] run function gm4_end_fishing:durability/prep_mainhand
execute unless entity @s[nbt={SelectedItem:{id:"minecraft:fishing_rod"}}] if entity @s[gamemode=!creative,nbt={Inventory:[{Slot:-106b,id:"minecraft:fishing_rod"}]}] run function gm4_end_fishing:durability/prep_offhand
