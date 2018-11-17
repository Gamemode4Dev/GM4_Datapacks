
#setting max number (amount +1)
scoreboard players set #gm4_max_rand gm4_rng 601

#calling function
function rng:set_rand

tellraw @p ["",{"score":{"name":"#gm4_rand_val","objective":"gm4_rng"},"color":"green"}]

entity: #gm4_rand_val 
score: gm4_rng