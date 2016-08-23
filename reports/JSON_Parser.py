import json
import os.path

Suffix = "_alltalents.json"

for i in range (1, 5):
    Enemies = str(i)+"t"
    if i == 4:
        Enemies = "1t_aa-4-3x-30-10"
    # Empty the file
    with open('Results_'+Enemies+'_Talents.txt', 'w', encoding='utf-8') as file:
        file.write("")
    # Fill with all the specs
    for j in range(1, 4):
        Prefix = ""
        if j == 1:
            Prefix = "rog_asn_t19m_"
        elif j == 2:
            Prefix = "rog_otl_t19m_"
        else:
            Prefix = "rog_sub_t19m_"
        if os.path.isfile(Prefix+Enemies+Suffix):
            #Read the right json report
            with open(Prefix+Enemies+Suffix, encoding='utf-8') as data_file:
                data = json.loads(data_file.read())
            #Append the results
            with open('Results_'+Enemies+'_Talents.txt', 'a', encoding='utf-8') as file:
                for k in range(len(data["sim"]["players"])):
                    file.write(str(data["sim"]["players"][k]["collected_data"]["dps"]["min"])+"\t")
                    file.write(str(data["sim"]["players"][k]["collected_data"]["dps"]["mean"])+"\t")
                    file.write(str(data["sim"]["players"][k]["collected_data"]["dps"]["max"])+"\n")

###

# Empty the file
with open('Results_Combo.txt', 'w', encoding='utf-8') as file:
    file.write("")

Suffix = "_default.json"

for i in range (1, 5):
    Enemies = str(i)+"t"
    if i == 4:
        Enemies = "1t_aa-4-3x-30-10"
    # Fill with all the specs
    for j in range(1, 4):
        Spec = ""
        if j == 1:
            Prefix = "rog_asn_t19m_"
        elif j == 2:
            Prefix = "rog_otl_t19m_"
        else:
            Prefix = "rog_sub_t19m_"
        if os.path.isfile(Prefix+Enemies+Suffix):
            #Read the right json report
            with open(Prefix+Enemies+Suffix, encoding='utf-8') as data_file:
                data = json.loads(data_file.read())
            #Append the results
            with open('Results_Combo.txt', 'a', encoding='utf-8') as file:
                for k in range(len(data["sim"]["players"])):
                    file.write(str(data["sim"]["players"][k]["collected_data"]["dps"]["min"])+"\t")
                    file.write(str(data["sim"]["players"][k]["collected_data"]["dps"]["mean"])+"\t")
                    if i == 1:
                        file.write("\t")
                    else:
                        file.write(str(data["sim"]["players"][k]["collected_data"]["prioritydps"]["mean"])+"\t")
                    file.write(str(data["sim"]["players"][k]["collected_data"]["dps"]["max"])+"\n")
    if i < 4:
        # Add some spaces
        with open('Results_Combo.txt', 'a', encoding='utf-8') as file:
            file.write("\n\n\n")