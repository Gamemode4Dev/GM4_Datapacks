#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ beetroots[age=3] run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ beetroots[age=3] run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ beetroots[age=3] align xyz positioned ~0.5 ~ ~0.5 run summon item ~ ~ ~ {PickupDelay:10s,Motion:[0.0,0.3,0.0],Item:{id:"minecraft:beetroot",Count:1b,tag:{CustomModelData:1,Enchantments:[{}],display:{Lore:['[{"translate":"effect.minecraft.speed","color":"blue","italic":false},{"text":" (3:00)","color":"blue","italic":false}]'],Name:'{"translate":"%1$s%3427655$s","with":["Infused Beetroot",{"translate":"item.gm4.infused_beetroot"}],"italic":false}'},gm4_potion_infusers:{item:"swiftness_beetroot"}}}}
execute if block ~ ~ ~ beetroots[age=3] run setblock ~ ~ ~ beetroots[age=0]
