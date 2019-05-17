#run from main
#@s = players with the gm4_has_arborenda tag .

#the active shamir is checked again in case players switched axes in the last clock cycle.
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"arborenda"}}}}] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:oak_log"}}] at @s run function arborenda_shamir:init_fell_oak
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"arborenda"}}}}] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:spruce_log"}}] at @s run function arborenda_shamir:init_fell_spruce
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"arborenda"}}}}] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:acacia_log"}}] at @s run function arborenda_shamir:init_fell_acacia
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"arborenda"}}}}] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:birch_log"}}] at @s run function arborenda_shamir:init_fell_birch
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"arborenda"}}}}] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:jungle_log"}}] at @s run function arborenda_shamir:init_fell_jungle
execute if entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"arborenda"}}}}] as @e[type=item,limit=1,distance=..5,sort=nearest,nbt={Age:0s,Item:{id:"minecraft:dark_oak_log"}}] at @s run function arborenda_shamir:init_fell_dark_oak
