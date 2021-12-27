import pandas
import json
import os

FILE_NAMESPACE = "gm4_guidebook/"
WIKI_LINK = "https://wiki.gm4.co/wiki/"
WEBSITE_LINK = "https://gm4.co/modules/"

TABLE_FOLDER = f"{FILE_NAMESPACE}/data/{FILE_NAMESPACE}/functions/analyze_storage/table_of_contents/find_page_number"
TABLE_PATH = f"gm4_guidebook:analyze_storage/table_of_contents/find_page_number"
PAGE_COUNT = 750
# change this ^^, delete the "find_page_number" folder (path above in line 10), then run this, then
# update line 11 in "gm4_guidebook:analyze_storage/table_of_contents/add_line" to update the max page number


DOC_ID = "1ToBBaGTEinkEVff60-zvP6Zbf8-9mJULhjQWriuiU0c"
DOC_SHEET = "Data"
DOC_URL = f"https://docs.google.com/spreadsheets/d/{DOC_ID}/gviz/tq?tqx=out:csv&sheet={DOC_SHEET}"

def create_tree(min, max, folder, path,):
    def create_function(value, file):
        json = '\'{"storage": "gm4_guidebook:register", "nbt": "modules[{page_number:' + str(value) + '}].module_name","color":"#4AA0C7","clickEvent":{"action":"change_page","value":"' + str(value) + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Jump to Section"},{"translate":"text.gm4.guidebook.jump_to_page"}],"color":"gold"}]}}\''
        file.write(f"execute if score $page gm4_guide matches {value} run data modify block 29999998 1 7133 Text1 set value {json}\n")

    def branch(min, max, folder, path, file):
        half = (max - min + 1) // 2 + min

        low, high = min, half - 1
        if high - low < 1:
            create_function(low, file)
        else:
            new_path = f"{path}/{low}_{high}"
            file.write(f"execute if score $page gm4_guide matches {low}..{high} run function {new_path}/search\n")
            create_tree(low, high, folder, new_path)

        low, high = half, max
        if high - low < 1:
            create_function(low, file)
        else:
            new_path = f"{path}/{low}_{high}"
            file.write(f"execute if score $page gm4_guide matches {low}..{high} run function {new_path}/search\n")
            create_tree(low, high, folder, new_path)

    folder = f"{folder}/{min}_{max}"
    filename = f"{folder}/search.mcfunction"
    os.makedirs(os.path.dirname(filename), exist_ok=True)

    with open(filename, "w") as file:
        if max - min < 4:
            while max - min >= 0:
                create_function(min, file)
                min += 1
        else:
            half = (max - min + 1) // 2 + min
            low, high = min, half - 1
            branch(low, high, folder, path, file)
            low, high = half, max
            branch(low, high, folder, path, file)


def write_json(path, content):
    filename = f"{path}.json"
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w") as file:
        json.dump(content, file, indent=2)
        file.write("\n")

def undefined(o):
    return (o != o)

data = pandas.read_csv(DOC_URL)
module_data = []

for module, modifier in data.groupby("Module"):
    def get_num_id(module_id):
        id = module_id.replace("_", "")
        n = []
        for l in id:
            n.append(ord(l) - 96)
        while len(n) < 11:
            n.append(0)
        id = n[0] * (27 ** 10) + n[1] * (27 ** 9) + n[2] * (27 ** 8) + n[3] * (27 ** 7) + n[4] * (27 ** 6) + n[5] * (27 ** 5) + n[6] * (27 ** 4) + n[7] * (27 ** 3) + n[8] * (27 ** 2) + n[9] * (27 ** 1) + n[10] * (27 ** 0)
        id /= 1000000000000
        return id

    for _, row in modifier.iterrows():
        [module_name, wiki_base, load_id, base_module, initial_json, initial_pages, unlockable_pages, line_count, done, initial_lock] = row
        module_id = module_name.lower().replace(" ","_")

        if undefined (wiki_base):
            wiki = module_name.replace(" ", "_")
        else:
            wiki = wiki_base + "/" + module_name.replace(" ", "_")
        wiki_link = WIKI_LINK + wiki

        if undefined(load_id):
            load_id = module_id

        num_id = get_num_id(module_id)
        
        if base_module == "none":
            module_type = "module"
        elif base_module == "self":
            module_type = "base"
        else:
            module_type = "expansion"

        if undefined(unlockable_pages):
            unlockable_pages = '""'
        unlockable_pages = list(unlockable_pages.split(" , "))

        if undefined(initial_pages):
            initial_pages = ""

        page_count = len(unlockable_pages) + initial_pages.count("[\"\",")

        module_data.append([module_id, module_name, wiki_link, load_id, module_type, base_module, initial_json, initial_pages, unlockable_pages, page_count, num_id, int(line_count), done, initial_lock])

generated_init = []
def generate_init(module):
    [module_id, module_name, wiki_link, load_id, module_type, base_module, initial_json, initial_pages, unlockable_pages, page_count, num_id, line_count, done, initial_lock] = module
    file = "gm4_" + load_id + "/data/gm4_" + load_id + "/functions/init.mcfunction"

    if load_id not in generated_init:
        replace = False
        generated_init.append(load_id)
        with open(file, "r") as f:
            lines = f.readlines()

        with open(file, "w") as f:
            for line in lines:
                if "guide" not in line:
                    f.write(line)
                else:
                    replace = True
        
        f = open(file,'r')
        filedata = f.read()
        f.close()

        if replace == True:
            newdata = filedata.replace("\n#$moduleUpdateList", "# guidebook\n\n#$moduleUpdateList")
        else:
            newdata = filedata.replace("#$moduleUpdateList", "# guidebook\n\n#$moduleUpdateList")

        f = open(file,'w')
        f.write(newdata)
        f.close()

    if module_type == "expansion":
        summon = '# guidebook\nexecute if score gm4_guidebook load.status matches 1 run summon marker ~ ' + str(num_id) + ' ~ {CustomName:\'"gm4_' + module_id + '_guide"\',Tags:["gm4_guide"],data:{type:"_expansion",base:"' + base_module + '",id:"' + module_id + '",page_count:' + str(page_count) + ',line_count:' + str(line_count) + ',module_name:"' + module_name + '"}}'
    elif module_type == "base":
        summon = '# guidebook\nexecute if score gm4_guidebook load.status matches 1 run summon marker ~ ' + str(num_id) + ' ~ {CustomName:\'"gm4_' + module_id + '_guide"\',Tags:["gm4_guide"],data:{type:"' + module_type + '",expansions:[],id:"' + module_id + '",page_count:' + str(page_count) + ',line_count:' + str(line_count) + ',module_name:"' + module_name + '"}}'
    else:
        summon = '# guidebook\nexecute if score gm4_guidebook load.status matches 1 run summon marker ~ ' + str(num_id) + ' ~ {CustomName:\'"gm4_' + module_id + '_guide"\',Tags:["gm4_guide"],data:{type:"' + module_type + '",id:"' + module_id + '",page_count:' + str(page_count) + ',line_count:' + str(line_count) + ',module_name:"' + module_name + '"}}'

    f = open(file,'r')
    filedata = f.read()
    f.close()

    newdata = filedata.replace("# guidebook", summon)

    f = open(file,'w')
    f.write(newdata)
    f.close()

def generate_function_tag(module):
    [module_id, module_name, wiki_link, load_id, module_type, base_module, initial_json, initial_pages, unlockable_pages, page_count, num_id, line_count, done, initial_lock] = module
    path = "gm4_" + load_id + "/data/gm4_guidebook/tags/functions/add_pages"

    json = {"values": []}
    json["values"].append(f"gm4_{load_id}:guidebook/verify_module")
    write_json(path, json)

def generate_root_advancement(module):
    [module_id, module_name, wiki_link, load_id, module_type, base_module, initial_json, initial_pages, unlockable_pages, page_count, num_id, line_count, done, initial_lock] = module
    path = "gm4_" + load_id + "/data/gm4_guidebook/advancements/root"

    json = {"criteria": {"requirement": {"trigger": "minecraft:impossible"}}}
    write_json(path, json)

def generate_unlock_tellraw(module):
    [module_id, module_name, wiki_link, load_id, module_type, base_module, initial_json, initial_pages, unlockable_pages, page_count, num_id, line_count, done, initial_lock] = module
    
    with open(f"gm4_{load_id}/pack.mcmeta", 'r') as file:
        data = file.read()

    mcmeta = json.loads(data)
    desc = mcmeta["site_description"]

    filename = "gm4_" + load_id + "/data/gm4_" + module_id + "/functions/guidebook/unlock_page.mcfunction"

    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w") as file:
        contents = '# tells the player that they discovered a page from this section\n# @s = player who unlocked a guidebook page\n# located at @s\n# run from advancement gm4_guidebook:' + module_id + '/page_<number>\n\ntellraw @s ["",{"selector":"@s"},{"text":" "},{"translate":"%1$s%3427655$s","with":[{"text":"has discovered a guidebook page from"},{"translate":"%1$s%3427655$s","with":[{"translate":"text.gm4.guidebook.discovered"}]}]},{"text":" "},{"text":"[' + module_name + ']","color":"#4AA0C7","hoverEvent":{"action":"show_text","contents":[{"text":"' + module_name + '","color":"#4AA0C7"},{"text":"\\n"},{"text":"' + desc + '","italic":true,"color":"gray"}]}}]'
        file.write(contents + "\n")

generated_verify = []
def generate_verify(module):
    [module_id, module_name, wiki_link, load_id, module_type, base_module, initial_json, initial_pages, unlockable_pages, page_count, num_id, line_count, done, initial_lock] = module

    filename = "gm4_" + load_id + "/data/gm4_" + load_id + "/functions/guidebook/verify_module.mcfunction"
    header = '# checks if this is the next module to generate pages\n# @s = player who\'s updating their guidebook\n# located at @s\n# run from #gm4_guidebook:add_pages\n\n'

    if load_id not in generated_verify:
        generated_verify.append(load_id)
        os.makedirs(os.path.dirname(filename), exist_ok=True)

        with open(filename, "w") as file:
            file.write(header)

    f = open(filename,'r')
    filedata = f.read()
    f.close()

    command = header + 'execute if data storage gm4_guidebook:temp module{id:"' + module_id + '"} run function gm4_' + module_id + ':guidebook/add_pages\n'
    newdata = filedata.replace(header, command)

    f = open(filename,'w')
    f.write(newdata)
    f.close()


def generate_add_pages(module):
    [module_id, module_name, wiki_link, load_id, module_type, base_module, initial_json, initial_pages, unlockable_pages, page_count, num_id, line_count, done, initial_lock] = module

    if undefined(initial_json):
        initial_json = ""
    else:
        initial_json = f",{initial_json}"

    if initial_pages != "":
        initial_pages = f",\'{initial_pages}"

    initial_page_count = initial_pages.count("\'[\"\",")
    if module_type != "expansion":
        initial_page_count += 1

    for i, page in enumerate(unlockable_pages):
        if len(page) > 3:
            initial_pages = initial_pages + ',\'["",{"text":"???","hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Undiscovered"},{"translate":"text.gm4.guidebook.undiscovered"}],"italic":true,"color":"red"}]}}]\''

    if module_type == "expansion":
        pages = '[\'["",{"text":"◀ ","color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Back"},{"translate":"text.gm4.guidebook.back"}],"color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"text":"\\\\n"},{"text":"☶ ","color":"#864BC7","bold":true,"clickEvent":{"action":"open_url","value":"' + wiki_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Wiki"},{"translate":"text.gm4.guidebook.wiki"}],"color":"#864BC7","clickEvent":{"action":"open_url","value":"' + wiki_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"text":"\\\\n\\\\n"},{"text":"' + module_name + '","underlined":true},{"text":"\\\\n"}' + initial_json + ']\'' + initial_pages + ']'
    else:
        pages = '[\'\',\'["",{"text":"◀ ","color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Back"},{"translate":"text.gm4.guidebook.back"}],"color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"text":"\\\\n"},{"text":"☶ ","color":"#864BC7","bold":true,"clickEvent":{"action":"open_url","value":"' + wiki_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Wiki"},{"translate":"text.gm4.guidebook.wiki"}],"color":"#864BC7","clickEvent":{"action":"open_url","value":"' + wiki_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"text":"\\\\n\\\\n"},{"text":"' + module_name + '","underlined":true},{"text":"\\\\n"}' + initial_json + ']\'' + initial_pages + ']'
    
    filename = "gm4_" + load_id + "/data/gm4_" + module_id + "/functions/guidebook/add_pages.mcfunction"

    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w") as file:
        if not initial_lock:
            contents = '# adds pages to the guidebook\n# @s = player who\'s updating their guidebook\n# located at @s\n# run from gm4_' + module_id + ':guidebook/verify_module\n\ndata modify storage gm4_guidebook:temp insert set value ' + pages + '\n\n# unlockable pages'
        else:
            advancement = 'gm4_guidebook:' + module_id + '/page_0=true'
            locked_json = '{"text":"???","hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Undiscovered"},{"translate":"text.gm4.guidebook.undiscovered"}],"italic":true,"color":"red"}]}}'
            if module_type == "expansion":
                locked_page = '[\'["",{"text":"◀ ","color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Back"},{"translate":"text.gm4.guidebook.back"}],"color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"text":"\\\\n"},{"text":"☶ ","color":"#864BC7","bold":true,"clickEvent":{"action":"open_url","value":"' + wiki_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Wiki"},{"translate":"text.gm4.guidebook.wiki"}],"color":"#864BC7","clickEvent":{"action":"open_url","value":"' + wiki_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"text":"\\\\n\\\\n"},{"text":"' + module_name + '","underlined":true},{"text":"\\\\n"},' + locked_json + ']\'' + initial_pages + ']'
            else:
                locked_page = '[\'\',\'["",{"text":"◀ ","color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Back"},{"translate":"text.gm4.guidebook.back"}],"color":"#4AA0C7","clickEvent":{"action":"change_page","value":"2"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Return to Table of Contents"},{"translate":"text.gm4.guidebook.return_to_table"}],"italic":true,"color":"gold"}]}},{"text":"\\\\n"},{"text":"☶ ","color":"#864BC7","bold":true,"clickEvent":{"action":"open_url","value":"' + wiki_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"translate":"%1$s%3427655$s","with":[{"text":"Wiki"},{"translate":"text.gm4.guidebook.wiki"}],"color":"#864BC7","clickEvent":{"action":"open_url","value":"' + wiki_link + '"},"hoverEvent":{"action":"show_text","contents":[{"translate":"%1$s%3427655$s","with":[{"text":"Open External Wiki"},{"translate":"text.gm4.guidebook.open_wiki"}],"italic":true,"color":"gold"}]}},{"text":"\\\\n\\\\n"},{"text":"' + module_name + '","underlined":true},{"text":"\\\\n"},' + locked_json + ']\'' + initial_pages + ']'
            contents = '# adds pages to the guidebook\n# @s = player who\'s updating their guidebook\n# located at @s\n# run from gm4_' + module_id + ':guidebook/verify_module\n\nexecute unless entity @s[advancements={' + advancement + '}] run data modify storage gm4_guidebook:temp insert set value ' + locked_page + '\nexecute if entity @s[advancements={' + advancement + '}] run data modify storage gm4_guidebook:temp insert set value ' + pages + '\n\n# unlockable pages'
        file.write(contents + "\n")
        for i, page in enumerate(unlockable_pages):
            if len(page) > 3:
                contents = 'execute if entity @s[advancements={gm4_guidebook:' + module_id + '/page_' + str(i) + '=true}] run data modify storage gm4_guidebook:temp insert[' + str(i + initial_page_count) + '] set value ' + str(page)
                file.write(contents + "\n")
    
create_tree(0, PAGE_COUNT - 1, f"{TABLE_FOLDER}", f"{TABLE_PATH}/0_{PAGE_COUNT - 1}")

for module in module_data:
    [module_id, module_name, wiki_link, load_id, module_type, base_module, initial_json, initial_pages, unlockable_pages, page_count, num_id, line_count, done, initial_lock] = module
    if not undefined(base_module):
        generate_init(module)
        generate_function_tag(module)
        generate_root_advancement(module)
        generate_unlock_tellraw(module)
        generate_verify(module)
        if not done:
            generate_add_pages(module)
