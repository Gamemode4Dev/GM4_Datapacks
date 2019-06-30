#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ melon run function potion_infusers:effects/failed
execute if block ~ ~ ~ melon run function potion_infusers:effects/success
execute if block ~ ~ ~ melon align xyz positioned ~0.5 ~ ~0.5 run summon item ~ ~ ~ {PickupDelay:10s,Motion:[0.0,0.3,0.0],Item:{id:"minecraft:melon_slice",Count:1b,tag:{CustomModelData:1,Enchantments:[{}],display:{Lore:['[{"translate":"effect.minecraft.instant_health","color":"blue","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Infused Melon Slice",{"translate":"item.gm4.infused_melon_slice"}],"italic":false}'},gm4_potion_infusers:{item:"healing_melon_slice"}}}}
execute if block ~ ~ ~ melon run setblock ~ ~ ~ air
