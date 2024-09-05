execute unless score tower_structures gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Tower Structures"}
execute unless score tower_structures gm4_earliest_version < tower_structures gm4_modules run scoreboard players operation tower_structures gm4_earliest_version = tower_structures gm4_modules
scoreboard players set tower_structures gm4_modules 1

team add gm4_hide_name
team modify gm4_hide_name nametagVisibility never



#$moduleUpdateList
