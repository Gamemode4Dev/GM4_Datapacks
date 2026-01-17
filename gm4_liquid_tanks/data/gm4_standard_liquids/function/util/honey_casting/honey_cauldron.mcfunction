#@s = liquid tank, positioned at empty cauldron
#run from standard_liquids:util_above

execute if score @s gm4_lt_util matches 4.. run scoreboard players remove @s gm4_lt_value 4
execute if score @s gm4_lt_util matches 4.. run summon item_display ~0.5 ~ ~0.5 :
    Tags:["gm4_lt_honey_display","gm4_no_edit"]
    CustomName:"gm4_lt_honey_display"
    item:
        id: "minecraft:honey_block"
        count: 1
        components: {"minecraft:custom_model_data":"block/cast_honey_block"}
    transformation:
        left_rotation: [0,0,0,1]
        right_rotation: [0,0,0,1]
        scale: [0.9,0.01,0.9]
        translation: [0.0,0.2,0.0]
    teleport_duration: 4

execute if score @s gm4_lt_util matches 4.. run playsound block.honey_block.slide block @a[distance=..10] ~ ~ ~ 1 0.5
execute if score @s gm4_lt_util matches 4.. run scoreboard players remove @s gm4_lt_util 4

execute unless score @s gm4_lt_prior_val = @s gm4_lt_value run function gm4_liquid_tanks:liquid_value_update

schedule function gm4_standard_liquids:util/honey_casting/scheduled_honey_rise 4t
