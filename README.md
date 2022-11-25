# summoners_timers_autohotkey_lol
A python and autohotkey script allowing you to time summoners in game with simples macro and will also put the couldown in chat for your allies



READ ME : 

The script will allow you to start timers by using macros when an enemy uses a spell, and by using another macro you will
know the exact time when the enemy will have his spells back. 

So what is the difference between this script and the porofessor extension ? 
The difference is simply that this script will give the infos in chat to your allies every time you use a macro.
The script will calculate if the enemies have cdr in rune, to time correctly the spell.
Know that you will need to open the script in an ide (like visual studio code) because it's not working in the terminal.


BEFORE THE GAME :

To start using the script you will need to enter a few parameters in the user_inputs file (enter the values in the ""):

apiKey  = ""     # get your https://developer.riotgames.com here if you don't have one yet, you will have to renew it every day 

my_region = ""    # simply enter your simplified region here (ex: euw, na, kr, etc)

pseudo = ""      # enter your in game pseudo here 

Once it's done simply launch the script "launcher" from the ide before your game or while your game.  


IN GAME :

Once your in game press F10 to give their values to the autohotkey variable, and do not forget to 
desactivate the script with  * to play the game,  and press * again to reactivate the script when 
you need to use the macros. 


USUABLE COMMANDS IN GAME :

To activate/desctivate the script simply press : *

To time a summoner's spell press : 'the first letter of the champion' and then '1' for the first spell or '2' for the second spell
(sometime if multiple champions start with the same letter the macro will be modifiate, press k to get the macros for the game)

To know when the summoner will be back press : 'ctrl' + '1' or 'ctrl' + '2' depending on the spell

To get all the commands keys press : k

To put in chat every couldown of the spells which you timed at the same time press : F1




