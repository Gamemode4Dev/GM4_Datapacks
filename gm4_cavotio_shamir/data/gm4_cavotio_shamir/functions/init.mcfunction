scoreboard objectives add gm4_use_pick_net minecraft.used:minecraft.netherite_pickaxe
scoreboard objectives add gm4_use_pick_dia minecraft.used:minecraft.diamond_pickaxe
scoreboard objectives add gm4_use_pick_gol minecraft.used:minecraft.golden_pickaxe
scoreboard objectives add gm4_use_pick_iro minecraft.used:minecraft.iron_pickaxe
scoreboard objectives add gm4_use_pick_sto minecraft.used:minecraft.stone_pickaxe
scoreboard objectives add gm4_use_pick_woo minecraft.used:minecraft.wooden_pickaxe

execute unless score cavotio_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Cavotio Shamir"}
scoreboard players set cavotio_shamir gm4_modules 1

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_cavotio_shamir:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_cavotio_shamir:band/v0",name:"[Drop to Fix Item] gm4_cavotio_shamir:band",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"cavotio",metal:{type:"thorium",amount:[12s],castable:1b},item:"obsidian_cast"},CustomModelData:3420123,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"#767676","translate":"%1$s%3427655$s","with":["Thorium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.thorium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Cavotio",{"translate":"item.gm4.shamir.cavotio"}]}']}}}

schedule function gm4_cavotio_shamir:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 367.217754760584 ~ {CustomName:'"gm4_cavotio_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"cavotio_shamir",page_count:2,line_count:1,module_name:"Cavotio Shamir"}}

#$moduleUpdateList
