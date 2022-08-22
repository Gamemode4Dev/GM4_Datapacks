# generates the predicates for checking vanilla item tags

import os, json, base64, getpass
from github import Github

VERSION = "1.19"
LOAD_VER = "2.1"
DIR = f"lib_machines/data/gm4_custom_crafters-{LOAD_VER}"



def main():
    tags = get_item_tags(VERSION)
    write_function_file(tags)
    write_predicates(tags)



def write_function_file(tags):
    filename = f"{DIR}/functions/check_item_tags.mcfunction"
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w") as file:
        contents = "# checks each slot for item tags\n# @s = crafter armor stand\n# located at the center of the block\n# run from gm4_custom_crafters-2.1:check_item via #gm4_custom_crafter:custom_item_checks\n\ndata modify entity @s HandItems[0] set from storage gm4_custom_crafters:temp/crafter item\n"
        file.write(contents + "\n")
        for tag in tags:
            contents = f"execute if predicate gm4_custom_crafters-2.1:vanilla_item_tags/{tag} run data modify storage gm4_custom_crafters:temp/crafter item.item_tags.minecraft.{tag} set value 1b"
            file.write(contents + "\n")
        contents = "\ndata remove entity @s HandItems[0]"
        file.write(contents + "\n")



def write_predicates(tags):
    path = f"{DIR}/predicates/vanilla_item_tags"
    for tag in tags:
        filename = f"{path}/{tag}.json"
        json = {"condition": "minecraft:entity_properties","entity": "this","predicate": {"equipment": {"mainhand": {"tag": "minecraft:air"}}}}
        json["predicate"]["equipment"]["mainhand"]["tag"] = f"minecraft:{tag}"
        write_json(filename, json)



def get_item_tags(version):
    login = getpass.getpass("Github Login Token: ")
    github = Github(login_or_token=login)
    repo = github.get_repo(full_name_or_id="misode/mcmeta")
    tag = version + "-data-json"
    sha = get_sha_for_tag(repo, tag)

    tags = []
    files = download_directory(repo, sha, "data/minecraft/tags/items")
    for file in files:
        tags.append(file[1].removesuffix(".json"))
    return tags



def get_sha_for_tag(repository, tag):
    """
    Returns a commit PyGithub object for the specified repository and tag.
    """
    branches = repository.get_branches()
    matched_branches = [match for match in branches if match.name == tag]
    if matched_branches:
        return matched_branches[0].commit.sha

    tags = repository.get_tags()
    matched_tags = [match for match in tags if match.name == tag]
    if not matched_tags:
        raise ValueError('No Tag or Branch exists with that name')
    return matched_tags[0].commit.sha



def download_directory(repository, sha, source):
    """
    Download all contents at source with commit tag sha in
    the repository.
    """
    files = []
    contents = repository.get_contents(source, ref=sha)

    for content in contents:
        print("Processing %s" % content.path)
        if content.type == 'dir':
            download_directory(repository, sha, content.path)
        else:
            path = content.path
            name = content.name
            file_content = repository.get_contents(path, ref=sha)
            decoded = base64.b64decode(file_content.content)
            decoded = decoded.decode('utf8').replace("'", '"')
            file_data = json.loads(decoded)
            files.append([path,name,file_data])
    return files



def write_json(path, content):
    if ".json" in path:
        filename = path
    else:
        filename = f"{path}.json"
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with open(filename, "w") as file:
        json.dump(content, file, indent=2)
        file.write("\n")



if __name__ == '__main__':
	main()
