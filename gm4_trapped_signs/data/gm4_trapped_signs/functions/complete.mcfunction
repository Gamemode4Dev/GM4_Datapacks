# @s = trapped sign
# run from process

execute if entity @s[tag=!gm4_secret_trapped_sign] run data modify block ~ ~ ~ front_text.messages[3] set value '{"text":"-*-","bold":false,"italic":false,"underlined":false,"color":"black","clickEvent":{"action":"run_command","value":"function gm4_trapped_signs:pulse"}}'
execute if entity @s[tag=gm4_secret_trapped_sign] run data modify block ~ ~ ~ front_text.messages[3] set value '{"text":"","bold":false,"italic":false,"underlined":false,"color":"black","clickEvent":{"action":"run_command","value":"function gm4_trapped_signs:pulse"}}'
data modify block ~ ~ ~ is_waxed set value 1b
tag @s add gm4_trapped_signs_completed
