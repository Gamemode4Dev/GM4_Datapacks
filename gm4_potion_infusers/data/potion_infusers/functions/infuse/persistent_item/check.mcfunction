#@s = infusing AEC with Age:80
#run from infusion

execute unless entity @e[type=item_frame,dx=0,nbt={Item:{}}] run function potion_infusers:effects/failed
execute if entity @e[type=item_frame,dx=0,nbt={Item:{}}] run function potion_infusers:effects/success
execute as @e[type=item_frame,dx=0,nbt={Item:{}},limit=1,sort=nearest] at @s align xyz positioned ~0.5 ~0.2 ~0.5 run function potion_infusers:infuse/persistent_item/spawn
