
from riotwatcher import LolWatcher, ApiError
import json
import string
import requests
import os
import time
import random
import sys 
import user_inputs as u

print(' __      __       .__                                ._._.\n'
'/  \    /  \ ____ |  |   ____  ____   _____   ____   | | |\n'
'\   \/\/   // __ \|  | _/ ___\/  _ \ /     \_/ __ \  | | |\n'
' \        /\  ___/|  |_\  \__(  <_> )  Y Y  \  ___/   \|\|\n'
'  \__/\  /  \___  >____/\___  >____/|__|_|  /\___  >  ____\n'
'       \/       \/          \/            \/     \/   \/\/\n')
print("")




# apiKey = input("Enter your API key: ")
#apiKey = 'RGAPI-dbe9270b-6d96-494c-90cf-cd9ea23b70aa'
apiKey = u.apiKey

watcher = LolWatcher(apiKey)

#my_region = input("Please, enter your region: ")
my_region = u.my_region
my_region = my_region.lower()

if my_region == 'eune':
    my_region = 'eun1'
elif my_region == 'euw':
    my_region = 'euw1'
elif my_region == 'na':
    my_region = 'na1'
elif my_region == 'br':
    my_region = 'br1'
elif my_region == 'jp':
    my_region = 'jp1'
elif my_region == "la":
    print("please specify la1 or la2")
    if input() == "1" or input() == "la1":
        my_region = 'la1'
    else:
        my_region = 'la2'
elif my_region == "kr":
    my_region = 'kr'
elif my_region == "oc":
    my_region = 'oc1'
elif my_region == "tr":
    my_region = 'tr1'
elif my_region == "ru":
    my_region = 'ru'
else:
    print("invalid region")
#my_region = 'euw1'


#pseudo = input("Please, enter your summoner name: ")
#pseudo = "Genius Monster6"
pseudo = u.pseudo
print("Waiting for the game to start...")
#sleep 10

me = watcher.summoner.by_name(my_region, pseudo)

#print("Welcome" + " " + pseudo + " to the app")

inGame = False 
while inGame == False:
    time.sleep(5)
    try:
        current_game = watcher.spectator.by_summoner(my_region, me['id'])
        inGame = True
    except ApiError as err:
        if err.response.status_code == 404:
            print("You are not in a game, waiting for game to start...")
        else:
            raise







#root.mainloop()



spectator = watcher.spectator.by_summoner(my_region, me["id"])
participants = spectator["participants"]

p = {}
for row in participants:
    players = row["summonerName"]
    p[players] = row["teamId"]

#print(p[pseudo])

ownTeamValue = p[pseudo]

enemyTeamValue = 100 if ownTeamValue == 200 else 200


patch = requests.get("https://ddragon.leagueoflegends.com/api/versions.json").json()[0]

champion = requests.get("https://ddragon.leagueoflegends.com/cdn/" + patch + "/data/en_US/champion.json").json()
champions = champion["data"]

summoner = requests.get("https://ddragon.leagueoflegends.com/cdn/" + patch + "/data/en_US/summoner.json").json()
summoners = summoner["data"]

perk = requests.get("http://ddragon.leagueoflegends.com/cdn/" + patch + "/data/en_US/runesReforged.json").json()



cosmicInsight = perk[1]["slots"][3]["runes"][0]["id"]

c = {}
for i in champions:
    #c[champions[i]["name"]] = champions[i]["key"]
    c[champions[i]["key"]] = champions[i]["name"]
    #print(c)


s = {}
for r in summoners:
    #s[summoners[r]["name"]] = summoners[r]["key"]
    s[summoners[r]["key"]] = summoners[r]["name"]
#print(s)


#for i in participants:
#    print(i["perks"])



enemyTeamValues = {}
runeValues = {}
summonersNames = []
for participant in participants:
    if participant["teamId"] == enemyTeamValue:
            #print(participant["perks"]["perkIds"])
            runeValues[participant["summonerName"]] = participant["perks"]["perkIds"]
            enemyTeamValues[participant["summonerName"]] = {"spell1" : participant["spell1Id"], "spell2" : participant["spell2Id"], "champion" : participant["championId"]}
            #print(enemyTeamValues)
            if participant["teamId"] != enemyTeamValue:
                summonersNames.append(participant["summonerName"])
                del enemyTeamValues["players"]
                del enemyTeamValues["spell1"]
                del enemyTeamValues["spell2"]
                del enemyTeamValues["champ"]
            #print(enemyTeamValues[participant["summonerName"]])
            y = participant["summonerName"]
            summonersNames.append(y)
            
            #print(c[y][champion])
            championLocked = str(enemyTeamValues[y]["champion"])
            #print(c[championLocked])

            #print(s[y][spell1])
            spell1Locked = str(enemyTeamValues[y]["spell1"])
            #print(s[spell1Locked])

            #print(s[y][spell2])
            spell2Locked = str(enemyTeamValues[y]["spell2"])
            #print(s[spell2Locked])
            


            enemyTeamValues[participant["summonerName"]] = {"spell1" : s[spell1Locked], "spell2" : s[spell2Locked], "champion" : c[championLocked]}

            




champion1Cdr = False
champion2Cdr = False
champion3Cdr = False
champion4Cdr = False
champion5Cdr = False



for i in runeValues[summonersNames[0]][0:]:
    if i == cosmicInsight:
        champion1Cdr = True


for i in runeValues[summonersNames[1]][0:]:
    if i == cosmicInsight:
        champion2Cdr = True


for i in runeValues[summonersNames[2]][0:]:
    if i == cosmicInsight:
        champion3Cdr = True


for i in runeValues[summonersNames[3]][0:]:
    if i == cosmicInsight:
        champion4Cdr = True


for i in runeValues[summonersNames[4]][0:]:
    if i == cosmicInsight:
        champion5Cdr = True


cdrDict = {summonersNames[0] : champion1Cdr, summonersNames[1] : champion2Cdr, summonersNames[2] : champion3Cdr, summonersNames[3] : champion4Cdr, summonersNames[4] : champion5Cdr}




if champion1Cdr == True:
    champion1RuneValue = "champ1Rune := True"
else:
    champion1RuneValue = "champ1Rune := False"

if champion2Cdr == True:
    champion2RuneValue = "champ2Rune := True"
else:
    champion2RuneValue = "champ2Rune := False"

if champion3Cdr == True:
    champion3RuneValue = "champ3Rune := True"
else:
    champion3RuneValue = "champ3Rune := False"

if champion4Cdr == True:
    champion4RuneValue = "champ4Rune := True"
else:
    champion4RuneValue = "champ4Rune := False"

if champion5Cdr == True:
    champion5RuneValue = "champ5Rune := True"
else:
    champion5RuneValue = "champ5Rune := False"



summoner1Name = summonersNames[0]
summoner2Name = summonersNames[1]
summoner3Name = summonersNames[2]
summoner4Name = summonersNames[3]
summoner5Name = summonersNames[4]

enemyTeamValueBySummonerName1 = enemyTeamValues[summoner1Name]
enemyTeamValueBySummonerName2 = enemyTeamValues[summoner2Name]
enemyTeamValueBySummonerName3 = enemyTeamValues[summoner3Name]
enemyTeamValueBySummonerName4 = enemyTeamValues[summoner4Name]
enemyTeamValueBySummonerName5 = enemyTeamValues[summoner5Name]

champion1 = enemyTeamValueBySummonerName1["champion"]
champion2 = enemyTeamValueBySummonerName2["champion"]
champion3 = enemyTeamValueBySummonerName3["champion"]
champion4 = enemyTeamValueBySummonerName4["champion"]
champion5 = enemyTeamValueBySummonerName5["champion"]

spell1T = enemyTeamValueBySummonerName1["spell1"]
spell1M = enemyTeamValueBySummonerName2["spell1"]
spell1A = enemyTeamValueBySummonerName3["spell1"]
spell1S = enemyTeamValueBySummonerName4["spell1"]
spell1J = enemyTeamValueBySummonerName5["spell1"]

spell2T = enemyTeamValueBySummonerName1["spell2"]
spell2M = enemyTeamValueBySummonerName2["spell2"]
spell2A = enemyTeamValueBySummonerName3["spell2"]
spell2S = enemyTeamValueBySummonerName4["spell2"]
spell2J = enemyTeamValueBySummonerName5["spell2"]






valuesScript = {
"champ21" : 'champ2Spell1 := ',
"champ22" : 'champ2Spell2 := ',
"champ31" : 'champ3Spell1 := ',
"champ32" : 'champ3Spell2 := ',
"champ11" : 'champ1Spell1 := ',
"champ12" : 'champ1Spell2 := ',
"champ51" : 'champ5Spell1 := ',
"champ52" : 'champ5Spell2 := ',
"champ41" : 'champ4Spell1 := ',
"champ42" : 'champ4Spell2 := ',
"champ1Spell1" : "champ1Spell1Name :=",
"champ1Spell2" : "champ1Spell2Name :=",
"champ5Spell1" : "champ5Spell1Name :=",
"champ5Spell2" : "champ5Spell2Name :=",
"champ2Spell1" : "champ2Spell1Name :=",
"champ2Spell2" : "champ2Spell2Name :=",
"champ3Spell1" : "champ3Spell1Name :=",
"champ3Spell2" : "champ3Spell2Name :=",
"champ4Spell1" : "champ4Spell1Name :=",
"champ4Spell2" : "champ4Spell2Name :=",
}


spellNameToCd = {
    "Flash" : 300000,
    "Teleport" : 240000,
    "Heal" : 240000,
    "Exhaust" : 210000,
    "Ghost" : 210000,
    "Cleanse" : 210000,
    "Barrier" : 180000,
    "Ignite" : 180000,
    "Smite" : 90000,
}




valueSpell1T = spellNameToCd[spell1T]
valueSpell1M = spellNameToCd[spell1M]
valueSpell1A = spellNameToCd[spell1A]
valueSpell1S = spellNameToCd[spell1S]
valueSpell1J = spellNameToCd[spell1J]

valueSpell2T = spellNameToCd[spell2T]
valueSpell2M = spellNameToCd[spell2M]
valueSpell2A = spellNameToCd[spell2A]
valueSpell2S = spellNameToCd[spell2S]
valueSpell2J = spellNameToCd[spell2J]



spell1TopValueBeforeModification =  "champ1Spell1 := x"
spell1MidValueBeforeModification =  "champ2Spell1 := x"
spell1AdcValueBeforeModification =  "champ3Spell1 := x"
spell1SuppValueBeforeModification =  "champ4Spell1 := x"
spell1JungValueBeforeModification =  "champ5Spell1 := x"

spell2TopValueBeforeModification =  "champ1Spell2 := x"
spell2MidValueBeforeModification =  "champ2Spell2 := x"
spell2AdcValueBeforeModification =  "champ3Spell2 := x"
spell2SuppValueBeforeModification =  "champ4Spell2 := x"
spell2JungValueBeforeModification =  "champ5Spell2 := x"

champion1ValueBeforeModification = "champion1Name := x"
champion2ValueBeforeModification = "champion2Name := x"
champion3ValueBeforeModification = "champion3Name := x"
champion4ValueBeforeModification = "champion4Name := x"
champion5ValueBeforeModification = "champion5Name := x"

champ1Spell1NameBeforeModification = "champ1Spell1Name := x"
champ2Spell1NameBeforeModification = "champ2Spell1Name := x"
champ3Spell1NameBeforeModification = "champ3Spell1Name := x"
champ4Spell1NameBeforeModification = "champ4Spell1Name := x"
champ5Spell1NameBeforeModification = "champ5Spell1Name := x"

champ1Spell2NameBeforeModification = "champ1Spell2Name := x"
champ2Spell2NameBeforeModification = "champ2Spell2Name := x"
champ3Spell2NameBeforeModification = "champ3Spell2Name := x"
champ4Spell2NameBeforeModification = "champ4Spell2Name := x"
champ5Spell2NameBeforeModification = "champ5Spell2Name := x"

keyForChamp1BeforeModfication = "keyForChamp1"
keyForChamp2BeforeModfication = "keyForChamp2"
keyForChamp3BeforeModfication = "keyForChamp3"
keyForChamp4BeforeModfication = "keyForChamp4"
keyForChamp5BeforeModfication = "keyForChamp5"



valuesT1 = 'champ1Spell1 := %s' % (valueSpell1T)
valuesM1 = 'champ2Spell1 := %s' % (valueSpell1M)
valuesA1 = 'champ3Spell1 := %s' % (valueSpell1A)
valuesS1 = 'champ4Spell1 := %s' % (valueSpell1S)
valuesJ1 = 'champ5Spell1 := %s' % (valueSpell1J)

valuesT2 = 'champ1Spell2 := %s' % (valueSpell2T)
valuesM2 = 'champ2Spell2 := %s' % (valueSpell2M)
valuesA2 = 'champ3Spell2 := %s' % (valueSpell2A)
valuesS2 = 'champ4Spell2 := %s' % (valueSpell2S)
valuesJ2 = 'champ5Spell2 := %s' % (valueSpell2J)

valuesChampionTop = 'champion1Name := "%s"' % (champion1)
valuesChampionMid = 'champion2Name := "%s"' % (champion2)
valuesChampionAdc = 'champion3Name := "%s"' % (champion3)
valuesChampionSupp = 'champion4Name := "%s"' % (champion4)
valuesChampionJung = 'champion5Name := "%s"' % (champion5)

valueSpell1NameT = 'champ1Spell1Name := "%s"' % (spell1T)
valueSpell1NameM = 'champ2Spell1Name := "%s"' % (spell1M)
valueSpell1NameA = 'champ3Spell1Name := "%s"' % (spell1A)
valueSpell1NameS = 'champ4Spell1Name := "%s"' % (spell1S)
valueSpell1NameJ = 'champ5Spell1Name := "%s"' % (spell1J)

valueSpell2NameT = 'champ1Spell2Name := "%s"' % (spell2T)
valueSpell2NameM = 'champ2Spell2Name := "%s"' % (spell2M)
valueSpell2NameA = 'champ3Spell2Name := "%s"' % (spell2A)
valueSpell2NameS = 'champ4Spell2Name := "%s"' % (spell2S)
valueSpell2NameJ = 'champ5Spell2Name := "%s"' % (spell2J)
valueCdrT = "champ1Rune := %s"  % (cdrDict[summonersNames[0]])
valueCdrM = "champ2Rune := %s"  % (cdrDict[summonersNames[1]])
valueCdrA = "champ3Rune := %s"  % (cdrDict[summonersNames[2]])
valueCdrS = "champ4Rune := %s"  % (cdrDict[summonersNames[3]])
valueCdrJ = "champ5Rune := %s"  % (cdrDict[summonersNames[4]])






champ1 = []
for i in range(0,len(champion1)):
    champ1.append(champion1[i])
    
champ2 = []
for i in range(0,len(champion2)):
    champ2.append(champion2[i])

champ3 = []
for i in range(0,len(champion3)):
    champ3.append(champion3[i])

champ4 = []
for i in range(0,len(champion4)):
    champ4.append(champion4[i])

champ5 = []
for i in range(0,len(champion5)):
    champ5.append(champion5[i])


keyForChamp1 = champ1[0]
keyForChamp2 = champ2[0]
keyForChamp3 = champ3[0]
keyForChamp4 = champ4[0]
keyForChamp5 = champ5[0]



usedLetters = []
usedLetters.append(keyForChamp1.lower())
usedLetters.append(keyForChamp2.lower())
usedLetters.append(keyForChamp3.lower())
usedLetters.append(keyForChamp4.lower())
usedLetters.append(keyForChamp5.lower())




alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

for i in usedLetters:
    if i in alphabet:
        alphabet.remove(i)




if keyForChamp1 == keyForChamp2 or keyForChamp1 == keyForChamp3 or keyForChamp1 == keyForChamp4 or keyForChamp1 == keyForChamp5:
    keyForChamp1 = alphabet[0]
    alphabet.remove(alphabet[0])

if keyForChamp2 == keyForChamp3 or keyForChamp2 == keyForChamp4 or keyForChamp2 == keyForChamp5 or keyForChamp2 == keyForChamp1:
    keyForChamp2 = alphabet[0]
    alphabet.remove(alphabet[0])

if keyForChamp3 == keyForChamp4 or keyForChamp3 == keyForChamp5 or keyForChamp3 == keyForChamp1 or keyForChamp3 == keyForChamp2:
    keyForChamp3 = alphabet[0]
    alphabet.remove(alphabet[0])

if keyForChamp4 == keyForChamp5 or keyForChamp4 == keyForChamp1 or keyForChamp4 == keyForChamp2 or keyForChamp4 == keyForChamp3:
    keyForChamp4 = alphabet[0]
    alphabet.remove(alphabet[0])







keyMessageBeforeModification = "/The_keys_for_this_game_are_:_CHAMP1==*///CHAMP2==*///CHAMP3==*///CHAMP4==*///CHAMP5==*"
keyMessage = "/The_keys_for_this_game_are_:_%s==%s///%s==%s///%s==%s///%s==%s///%s==%s" % (champion1.upper(), keyForChamp1.upper(), champion2.upper(), keyForChamp2.upper(), champion3.upper(), keyForChamp3.upper(), champion4.upper(), keyForChamp4.upper(), champion5.upper(), keyForChamp5.upper())


print(keyMessage)

path = os.getcwd()

with open(r""+path+"\script\macro.ahk", 'r') as file :
    filedata = file.read()
    for i in summonersNames:
        filedata = filedata.replace(spell1TopValueBeforeModification, valuesT1)
        filedata = filedata.replace(spell1MidValueBeforeModification, valuesM1)
        filedata = filedata.replace(spell1AdcValueBeforeModification, valuesA1)
        filedata = filedata.replace(spell1SuppValueBeforeModification, valuesS1)
        filedata = filedata.replace(spell1JungValueBeforeModification, valuesJ1)
        filedata = filedata.replace(spell2TopValueBeforeModification, valuesT2)
        filedata = filedata.replace(spell2MidValueBeforeModification, valuesM2)
        filedata = filedata.replace(spell2AdcValueBeforeModification, valuesA2)
        filedata = filedata.replace(spell2SuppValueBeforeModification, valuesS2)
        filedata = filedata.replace(spell2JungValueBeforeModification, valuesJ2)
        filedata = filedata.replace(champion1ValueBeforeModification, valuesChampionTop)
        filedata = filedata.replace(champion2ValueBeforeModification, valuesChampionMid)
        filedata = filedata.replace(champion3ValueBeforeModification, valuesChampionAdc)
        filedata = filedata.replace(champion4ValueBeforeModification, valuesChampionSupp)
        filedata = filedata.replace(champion5ValueBeforeModification, valuesChampionJung)
        filedata = filedata.replace(champ1Spell1NameBeforeModification, valueSpell1NameT)
        filedata = filedata.replace(champ2Spell1NameBeforeModification, valueSpell1NameM)
        filedata = filedata.replace(champ3Spell1NameBeforeModification, valueSpell1NameA)
        filedata = filedata.replace(champ4Spell1NameBeforeModification, valueSpell1NameS)
        filedata = filedata.replace(champ5Spell1NameBeforeModification, valueSpell1NameJ)
        filedata = filedata.replace(champ1Spell2NameBeforeModification, valueSpell2NameT)
        filedata = filedata.replace(champ2Spell2NameBeforeModification, valueSpell2NameM)
        filedata = filedata.replace(champ3Spell2NameBeforeModification, valueSpell2NameA)
        filedata = filedata.replace(champ4Spell2NameBeforeModification, valueSpell2NameS)
        filedata = filedata.replace(champ5Spell2NameBeforeModification, valueSpell2NameJ)
        filedata = filedata.replace(keyForChamp1BeforeModfication, keyForChamp1)
        filedata = filedata.replace(keyForChamp2BeforeModfication, keyForChamp2)
        filedata = filedata.replace(keyForChamp3BeforeModfication, keyForChamp3)
        filedata = filedata.replace(keyForChamp4BeforeModfication, keyForChamp4)
        filedata = filedata.replace(keyForChamp5BeforeModfication, keyForChamp5)
        filedata = filedata.replace("champ1Rune := x", valueCdrT)
        filedata = filedata.replace("champ2Rune := x", valueCdrM)
        filedata = filedata.replace("champ3Rune := x", valueCdrA)
        filedata = filedata.replace("champ4Rune := x", valueCdrS)
        filedata = filedata.replace("champ5Rune := x", valueCdrJ)
        filedata = filedata.replace(keyMessageBeforeModification, keyMessage)

with open(""+path+"\script\macro.ahk", 'w') as file:
    file.write(filedata)



try:
    os.system("taskkill /f /im AutoHotkey.exe")
    time.sleep(5)
    os.startfile(r""+path+"\script\macro.ahk")
except:
    os.startfile(r""+path+"\script\macro.ahk")


print("script started")


# the next line will open the file test25.ahk in the script folder
#os.startfile(r"\script\test25.ahk")
