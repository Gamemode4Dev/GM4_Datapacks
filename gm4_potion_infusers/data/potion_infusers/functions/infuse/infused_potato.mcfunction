#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ potatoes[age=7] run function potion_infusers:effects/failed
execute if block ~ ~ ~ potatoes[age=7] run function potion_infusers:effects/success
execute if block ~ ~ ~ potatoes[age=7] align xyz positioned ~0.5 ~ ~0.5 run summon item ~ ~ ~ {PickupDelay:10s,Motion:[0.0,0.3,0.0],Item:{id:"minecraft:potato",Count:1b,tag:{CustomModelData:1,Enchantments:[{}],display:{Lore:['[{"translate":"effect.minecraft.fire_resistance","color":"blue","italic":false},{"text":" (3:00)","color":"blue","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Infused Potato",{"translate":"item.gm4.infused_potato"}],"italic":false}'},gm4_potion_infusers:{item:"fire_resistance_potato"}}}}
execute if block ~ ~ ~ potatoes[age=7] run setblock ~ ~ ~ potatoes[age=0]
