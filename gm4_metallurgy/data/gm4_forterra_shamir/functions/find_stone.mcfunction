#run from metallurgy:pulse_check
#@s = server
execute as @a[tag=gm4_has_forterra,scores={gm4_forterra_use=1..},nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"forterra"}}}}] at @s as @e[distance=..5,type=item,nbt={Age:0s,Item:{id:"minecraft:cobblestone"}}] at @s run function gm4_forterra_shamir:randomize_drops
scoreboard players reset @a gm4_forterra_use
