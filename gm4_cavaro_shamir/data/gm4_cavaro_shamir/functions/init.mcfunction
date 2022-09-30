execute unless score cavaro_shamir gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Cavaro Shamir"}
scoreboard players set cavaro_shamir gm4_modules 1

# scoreboard objectives
scoreboard players set #128 gm4_ml_data 128
scoreboard objectives add gm4_use_pickaxe_net minecraft.used:minecraft.netherite_pickaxe
scoreboard objectives add gm4_use_pickaxe_dia minecraft.used:minecraft.diamond_pickaxe
scoreboard objectives add gm4_use_pickaxe_gol minecraft.used:minecraft.golden_pickaxe
scoreboard objectives add gm4_use_pickaxe_iro minecraft.used:minecraft.iron_pickaxe
scoreboard objectives add gm4_use_pickaxe_sto minecraft.used:minecraft.stone_pickaxe
scoreboard objectives add gm4_use_pickaxe_woo minecraft.used:minecraft.wooden_pickaxe

scoreboard objectives add gm4_use_shovel_net minecraft.used:minecraft.netherite_shovel
scoreboard objectives add gm4_use_shovel_dia minecraft.used:minecraft.diamond_shovel
scoreboard objectives add gm4_use_shovel_gol minecraft.used:minecraft.golden_shovel
scoreboard objectives add gm4_use_shovel_iro minecraft.used:minecraft.iron_shovel
scoreboard objectives add gm4_use_shovel_sto minecraft.used:minecraft.stone_shovel
scoreboard objectives add gm4_use_shovel_woo minecraft.used:minecraft.wooden_shovel

# register shamir with lib_player_heads
execute unless data storage gm4_player_heads:register heads[{id:"gm4_cavaro:band/v0"}] run data modify storage gm4_player_heads:register heads append value {id:"gm4_cavaro_shamir:band/v1",name:"[Drop to Fix Item] gm4_cavaro_shamir:band/v0",item:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"cavaro",metal:{type:"thorium",amount:[12s],castable:1b},item:"obsidian_cast"},SkullOwner:{Id:[I;1709100198,-881135263,-295939255,1602156123],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE2NjM1MTAwNzIsInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTYzOTJhNmQ5OWY5MzE5ZWU3YzRmNGMxYTE5NzQ5ZDY4N2NkY2M4ZWVjOGZjNjY4ZTczZDM3YTZkYWY3N2EifX19"}]}},CustomModelData:3420140,display:{Name:'{"italic":false,"translate":"%1$s%3427655$s","with":["Obsidian Cast",{"translate":"item.gm4.metallurgy.obsidian_cast"}]}',Lore:['{"italic":false,"color":"#767676","translate":"%1$s%3427655$s","with":["Thorium Band",{"translate":"item.gm4.metallurgy.band","with":[{"translate":"item.gm4.metallurgy.thorium"}]}]}','{"italic":false,"color":"aqua","translate":"%1$s%3427655$s","with":["Shamir",{"translate":"item.gm4.metallurgy.shamir"}]}','{"italic":false,"color":"gray","translate":"%1$s%3427655$s","with":["Cavaro",{"translate":"item.gm4.shamir.cavaro"}]}']}}}

schedule function gm4_cavaro_shamir:tick 6t

#$moduleUpdateList
