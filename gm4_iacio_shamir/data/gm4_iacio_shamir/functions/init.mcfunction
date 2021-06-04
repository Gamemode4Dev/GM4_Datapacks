scoreboard objectives add gm4_iacio_tridnt minecraft.used:minecraft.trident
scoreboard objectives add gm4_iacio_item minecraft.custom:minecraft.drop
scoreboard objectives add gm4_iacio_pearl minecraft.used:minecraft.ender_pearl
scoreboard objectives add gm4_iacio_snowbl minecraft.used:minecraft.snowball
scoreboard objectives add gm4_iacio_egg minecraft.used:minecraft.egg
scoreboard objectives add gm4_iacio_splash minecraft.used:minecraft.splash_potion
scoreboard objectives add gm4_iacio_linger minecraft.used:minecraft.lingering_potion

execute unless score iacio_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Iacio shamir"}
scoreboard players set iacio_shamir gm4_modules 1

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_iacio_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_iacio_shamir:band/v0",name:"[Drop to Fix Item] gm4_iacio_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"iacio",metal:{type:"barium",amount:[12s],castable:1b},item:"obsidian_cast"},CustomModelData:122,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"white","translate":"%1$s%3427655$s","with":["Barium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.barium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Iacio",{"translate":"item.gm4.shamir.iacio"}]}']}}}

#$moduleUpdateList
