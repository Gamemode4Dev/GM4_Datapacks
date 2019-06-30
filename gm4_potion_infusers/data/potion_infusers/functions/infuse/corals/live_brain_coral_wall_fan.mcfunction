#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_brain_coral_wall_fan run function potion_infusers:effects/failed
execute if block ~ ~ ~ dead_brain_coral_wall_fan run function potion_infusers:effects/success
execute if block ~ ~ ~ dead_brain_coral_wall_fan[facing=north,waterlogged=true] run setblock ~ ~ ~ brain_coral_wall_fan[facing=north,waterlogged=true]
execute if block ~ ~ ~ dead_brain_coral_wall_fan[facing=south,waterlogged=true] run setblock ~ ~ ~ brain_coral_wall_fan[facing=south,waterlogged=true]
execute if block ~ ~ ~ dead_brain_coral_wall_fan[facing=east,waterlogged=true] run setblock ~ ~ ~ brain_coral_wall_fan[facing=east,waterlogged=true]
execute if block ~ ~ ~ dead_brain_coral_wall_fan[facing=west,waterlogged=true] run setblock ~ ~ ~ brain_coral_wall_fan[facing=west,waterlogged=true]
execute if block ~ ~ ~ dead_brain_coral_wall_fan[facing=north,waterlogged=false] run setblock ~ ~ ~ brain_coral_wall_fan[facing=north,waterlogged=false]
execute if block ~ ~ ~ dead_brain_coral_wall_fan[facing=south,waterlogged=false] run setblock ~ ~ ~ brain_coral_wall_fan[facing=south,waterlogged=false]
execute if block ~ ~ ~ dead_brain_coral_wall_fan[facing=east,waterlogged=false] run setblock ~ ~ ~ brain_coral_wall_fan[facing=east,waterlogged=false]
execute if block ~ ~ ~ dead_brain_coral_wall_fan[facing=west,waterlogged=false] run setblock ~ ~ ~ brain_coral_wall_fan[facing=west,waterlogged=false]
