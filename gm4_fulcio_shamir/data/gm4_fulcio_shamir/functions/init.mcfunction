scoreboard objectives add gm4_fulcio_sneak minecraft.custom:minecraft.sneak_time

execute unless score fulcio_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Fulcio Shamir"}
scoreboard players set fulcio_shamir gm4_modules 1

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_fulcio_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_fulcio_shamir:band/v0",name:"[Drop to Fix Item] gm4_fulcio_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"fulcio",metal:{type:"barimium",amount:[9s,3s],castable:1b},item:"obsidian_cast"},CustomModelData:115,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"light_purple","translate":"%1$s%3427655$s","with":["Barimium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.barimium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Fulcio",{"translate":"item.gm4.shamir.fulcio"}]}']}}}

schedule function gm4_fulcio_shamir:main 1t
schedule function gm4_fulcio_shamir:4_tick 1t

#$moduleUpdateList
