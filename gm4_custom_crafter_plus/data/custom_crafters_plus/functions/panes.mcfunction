# entity who runs these commands = @e[tag=gm4_craftingstand,type=armor_stand]
# Run from pulse_check

replaceitem block ~ ~ ~ container.0 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.1 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.5 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.6 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.7 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.8 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.9 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.10 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.14 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.15 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.17 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.18 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.19 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.23 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.24 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.25 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
replaceitem block ~ ~ ~ container.26 minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1

kill @e[type=item,nbt={Item:{id:"minecraft:black_stained_glass_pane",tag:{display:{Name:"{\"text\":\"####\"}"}}}}]
clear @a minecraft:black_stained_glass_pane{display:{Name:"{\"text\":\"####\"}"}} 1
