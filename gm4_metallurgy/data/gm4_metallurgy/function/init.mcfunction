scoreboard objectives add gm4_ml_data dummy
scoreboard objectives add gm4_ml_heat dummy

scoreboard objectives add gm4_ml_ore_al dummy
scoreboard objectives add gm4_ml_ore_ba dummy
scoreboard objectives add gm4_ml_ore_bi dummy
scoreboard objectives add gm4_ml_ore_th dummy

#arborenda
scoreboard objectives add gm4_use_axe_net minecraft.used:minecraft.netherite_axe
scoreboard objectives add gm4_use_axe_dia minecraft.used:minecraft.diamond_axe
scoreboard objectives add gm4_use_axe_gol minecraft.used:minecraft.golden_axe
scoreboard objectives add gm4_use_axe_iro minecraft.used:minecraft.iron_axe
scoreboard objectives add gm4_use_axe_sto minecraft.used:minecraft.stone_axe
scoreboard objectives add gm4_use_axe_woo minecraft.used:minecraft.wooden_axe
scoreboard objectives add gm4_arb_depth dummy
scoreboard objectives add gm4_arb_data dummy
scoreboard players set #1 gm4_arb_data 1
#declare gm4_arborenda_shamir:temp

#ender_bolt
scoreboard objectives add gm4_bolt_time dummy
scoreboard objectives add gm4_ender_bolt_own_id dummy
scoreboard objectives add gm4_ender_bolt_foreign_id dummy
execute unless score $enable_pvp gm4_ender_bolt_foreign_id matches 0..1 run scoreboard players set $enable_pvp gm4_ender_bolt_foreign_id 1 

#infinitas
scoreboard objectives add gm4_infinitas_empty_held dummy
scoreboard objectives add gm4_infinitas_lava_held dummy
scoreboard objectives add gm4_infinitas_powder_snow_held dummy
scoreboard objectives add gm4_infinitas_water_held dummy
scoreboard objectives add gm4_infinitas_leave minecraft.custom:leave_game
scoreboard objectives add gm4_infinitas_success_check dummy
scoreboard players add $lava_infinitas gm4_ml_data 0
scoreboard players add $powder_snow_infinitas gm4_ml_data 0

#musical
scoreboard objectives add gm4_note_collect totalKillCount
scoreboard objectives add gm4_note_time dummy

#sensus
scoreboard players set $current_sensus_layer gm4_ml_data 0

#vibro
scoreboard objectives add gm4_vibro_fall minecraft.custom:minecraft.fall_one_cm
scoreboard objectives add gm4_vibro_hurt minecraft.custom:minecraft.damage_taken
scoreboard objectives add gm4_vibro_absorb minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add gm4_vibro_shock dummy
scoreboard objectives add gm4_vibro_sneak dummy
scoreboard players set #shock_multiplier gm4_vibro_shock 20
scoreboard players set #100 gm4_vibro_shock 100

execute unless score metallurgy gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Metallurgy"}
execute unless score metallurgy gm4_earliest_version < metallurgy gm4_modules run scoreboard players operation metallurgy gm4_earliest_version = metallurgy gm4_modules
scoreboard players set metallurgy gm4_modules 1

schedule function gm4_metallurgy:main 1t
schedule function gm4_metallurgy:tick 1t


execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4190.524302292533 ~ {CustomName:'"gm4_tinker_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"tinker_shamir",page_count:2,line_count:1,module_name:"Tinker Shamir"}}
# execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4036.671663623452 ~ {CustomName:'"gm4_spiraculum_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"spiraculum_shamir",page_count:2,line_count:1,module_name:"Spiraculum Shamir"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3954.220676160291 ~ {CustomName:'"gm4_sensus_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"sensus_shamir",page_count:2,line_count:1,module_name:"Sensus Shamir"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2842.183752154645 ~ {CustomName:'"gm4_musical_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"musical_shamir",page_count:2,line_count:1,module_name:"Musical Shamir"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2794.981082999508 ~ {CustomName:'"gm4_moneo_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"moneo_shamir",page_count:2,line_count:1,module_name:"Moneo Shamir"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2720.37658849128 ~ {CustomName:'"gm4_metallurgy_guide"',Tags:["gm4_guide"],data:{type:"base",expansions:[],id:"metallurgy",page_count:8,line_count:1,module_name:"Metallurgy"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1842.349698923932 ~ {CustomName:'"gm4_hypexperia_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"hypexperia_shamir",page_count:2,line_count:1,module_name:"Hypexperia Shamir"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1483.137202523499 ~ {CustomName:'"gm4_gemini_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"gemini_shamir",page_count:2,line_count:1,module_name:"Gemini Shamir"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1355.025898545877 ~ {CustomName:'"gm4_forterra_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"forterra_shamir",page_count:2,line_count:1,module_name:"Forterra Shamir"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1137.40305566453 ~ {CustomName:'"gm4_ender_bolt_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"ender_bolt_shamir",page_count:2,line_count:1,module_name:"Ender Bolt Shamir"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 863.614203429438 ~ {CustomName:'"gm4_defuse_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"defuse_shamir",page_count:2,line_count:1,module_name:"Defuse Shamir"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 343.880704028915 ~ {CustomName:'"gm4_arborenda_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"arborenda_shamir",page_count:2,line_count:1,module_name:"Arborenda Shamir"}}

#$moduleUpdateList
