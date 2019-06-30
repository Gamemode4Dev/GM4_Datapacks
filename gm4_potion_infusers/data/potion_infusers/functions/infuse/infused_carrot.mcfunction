#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ carrots[age=7] run function potion_infusers:effects/failed
execute if block ~ ~ ~ carrots[age=7] run function potion_infusers:effects/success
execute if block ~ ~ ~ carrots[age=7] align xyz positioned ~0.5 ~ ~0.5 run summon item ~ ~ ~ {PickupDelay:10s,Motion:[0.0,0.3,0.0],Item:{id:"minecraft:carrot",Count:1b,tag:{CustomModelData:1,Enchantments:[{}],display:{Lore:['[{"translate":"effect.minecraft.night_vision","color":"blue","italic":false},{"text":" (3:00)","color":"blue","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Infused Carrot",{"translate":"item.gm4.infused_carrot"}],"italic":false}'},gm4_potion_infusers:{item:"night_vision_carrot"}}}}
execute if block ~ ~ ~ carrots[age=7] run setblock ~ ~ ~ carrots[age=0]
