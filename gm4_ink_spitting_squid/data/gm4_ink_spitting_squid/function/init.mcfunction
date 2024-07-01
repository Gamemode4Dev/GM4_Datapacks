execute unless score ink_spitting_squid gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Ink Spitting Squid"}
execute unless score ink_spitting_squid gm4_earliest_version < ink_spitting_squid gm4_modules run scoreboard players operation ink_spitting_squid gm4_earliest_version = ink_spitting_squid gm4_modules
scoreboard players set ink_spitting_squid gm4_modules 1

schedule function gm4_ink_spitting_squid:main 1t



#$moduleUpdateList
