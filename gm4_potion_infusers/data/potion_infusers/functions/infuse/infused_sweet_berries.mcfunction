#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ sweet_berry_bush[age=3] run function potion_infusers:effects/failed
execute if block ~ ~ ~ sweet_berry_bush[age=3] run function potion_infusers:effects/success
execute if block ~ ~ ~ sweet_berry_bush[age=3] align xyz positioned ~0.5 ~ ~0.5 run summon item ~ ~ ~ {PickupDelay:10s,Motion:[0.0,0.3,0.0],Item:{id:"minecraft:sweet_berries",Count:1b,tag:{CustomModelData:1,Enchantments:[{}],display:{Lore:['[{"translate":"effect.minecraft.strength","color":"blue","italic":false},{"text":" (3:00)","color":"blue","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Infused Sweet Berries",{"translate":"item.gm4.infused_sweet_berries"}],"italic":false}'},gm4_potion_infusers:{item:"strength_sweet_berries"}}}}
execute if block ~ ~ ~ sweet_berry_bush[age=3] run setblock ~ ~ ~ sweet_berry_bush[age=0]
