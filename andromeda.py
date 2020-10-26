# Andromeda
# Pre-Release Version

from time import sleep
from pickle import loads, dumps
from os import name, system, listdir, mkdir, remove, path

def clear():
    if(name == 'nt'):
        system("cls")
    else:
        system("clear")

__version__ = "PR"
exectype = "dev"

# This is where the save is loaded into. Also this is where things are changed before they get saved.
userdict = { # This is just to keep track of possible keys. There will be a different dictionary for connection statuses.
    "username": None,
    "password": None,
    "savepath": None,
    "conpath": None,
    "creationVersion": None
}

condictdefault = { # Default dictionary for connections. 0: Offline | 1: Online, User has no access | 2: Online, User has basic access | 3: Online, User has admin access | 4: Public server. User will usually only have Guest access.
    "rpl": 4
}

condictloaded = { # Loads in the user's dictionary of connections.
}

def getConStat(connection):
    try:
        ccstatus = condictloaded[connection]
    except KeyError:
        try:
            ccstatus2 = condictdefault[connection]
        except KeyError: # The key queried doesnt exist.
            return "Key does not exist."
        else: # Return what was loaded from default.
            return ccstatus2
    else: # Just give what was loaded
        return ccstatus


# This is where it saves :/
def saveUser():
    shouldSaveThis = userdict
    
    save2 = open(shouldSaveThis["savepath"], "wb")
    save2.write(dumps(shouldSaveThis))
    save2.close()

def savelistAppend(username, path):
    slst = open("AndromedaSaves/.savelist", "rb")
    slstloaded = loads(slst.read())
    slst.close()

    inserter = {"name": username, "path": path}
    slstloaded.append(inserter)
    slst = open("AndromedaSaves/.savelist", "wb")
    slst.write(dumps(slstloaded))
    slst.close()

def saveConnectionDict():
    confile = open(userdict["conpath"], "wb")
    confile.write(dumps(condictloaded))
    confile.close()

# Detect if there is a directory of saves.

currentDir = listdir()

saveStepsMode = 0
for i in currentDir:
    if(i == 'AndromedaSaves'):
        saveStepsMode = 1
        # Now detect if a list of saves exists.
        savesDir = listdir("AndromedaSaves")
        for b in savesDir:
            if(b == '.savelist'):
                saveStepsMode = 2
                break
            else:
                pass
        break
    else:
        pass

# Create some stuff if saveStepsMode is 0 or 1

savelistloaded = None # This is where the savelist will be dumped.
savelisttemplate = []
savelisttemplate = dumps(savelisttemplate)

if(saveStepsMode == 0):
    mkdir("AndromedaSaves")
    savelist = open("AndromedaSaves/.savelist", "x")
    savelist.close()

if(saveStepsMode == 0 or saveStepsMode == 1):
    savelist = open("AndromedaSaves/.savelist", "wb")
    savelist.write(savelisttemplate)
    savelist.close()

# Now actually present the login.
while True:
    savelistloaded = open('AndromedaSaves/.savelist', "rb")
    savelist = savelistloaded.read()
    savelistloaded.close()

    savelist = loads(savelist)
    clear()
    print("ANDROMEDA VIRTUAL MANAGER")
    print("")
    v = 0
    for i in savelist:
        print(str(v) + ") " + i["name"])
        v = v + 1
    print("\nType 'new' to create a new profile.")
    print("Type 'delete' to remove a save. One completed cannot be undone.\n")
    profselect = input("Profile: ")
    if(profselect == 'new'):
        print("\n")
        print("New Profile")
        print("")
        while True:
            profUsername = input("Username: ")
            profPassword = input("Password: ")
            if(profUsername.strip() == ""):
                print("A username is required.")
                sleep(5)
            else:
                if(profPassword.strip() == ""):
                    print("A password is required.")
                    sleep(5)
                else:
                    print("PROFILE")
                    print("Username: {}".format(profUsername.strip()))
                    print("Password: {}".format(profPassword.strip()))
                    ays = input("Y/N: ")
                    if(ays == "n" or ays == "N" or ays == "no" or ays == "NO" or ays == "No"):
                        pass
                    else:
                        print("Writing username and password...")
                        userdict["username"] = profUsername.strip()
                        userdict["password"] = profPassword.strip()
                        sleep(2)
                        userdict["savepath"] = "AndromedaSaves/{}.save".format(userdict["username"])
                        savelistAppend(userdict["username"], userdict["savepath"])
                        userdict["conpath"] = "AndromedaSaves/{}_connections.save".format(userdict["username"])
                        cons = open(userdict["conpath"], "wb")
                        cons.write(dumps(condictdefault))
                        saveUser()
                        clear()
                        break
    elif(profselect == 'delete'):
        profdel = input("Delete Profile NAME (case sensitive): ")
        delsavelst = open("AndromedaSaves/.savelist", "rb")
        delsvls = loads(delsavelst.read())
        kt = 0
        for i in delsvls:
            if(i["name"] == profdel):
                delsvls.pop(kt)
            else:
                pass
            kt += 1
        delsavelst.close()
        delsavelst = open("AndromedaSaves/.savelist", "wb")
        delsavelst.write(dumps(delsvls))
        delsavelst.close()
        if(path.exists("AndromedaSaves/{}.save".format(profdel)) == True):
            remove("AndromedaSaves/{}.save".format(profdel))
            if(path.exists("AndromedaSaves/{}_connections.save".format(profdel)) == True):
                remove("AndromedaSaves/{}_connections.save".format(profdel))
            print("Done.")
        else:
            print("This save doesn't exist sooooo... Nothing happened.")
    elif(profselect.strip() == ''):
        print("ya need to type an option...")
        sleep(5)
    else:
        selectedSave = 'this wasnt overwritten'
        try:
            convToInteger = int(profselect)
        except ValueError:
            print("is this option up there? no! ya gotta type an option listed above.")
            input("Enter to continue.")
        except:
            print("an error occured that wasn't expected. please try again later :)")
            raise SystemExit
        else:
            selectedSave = convToInteger
        
        if(selectedSave == 'this wasnt overwritten'):
            clear()
        else:
            try:
                selectedSaved = savelist[selectedSave]
            except IndexError:
                print("That number wasnt in the range of saves that could be loaded. put in a number that shows up.")
                input("Ok. (enter to continue)")
            else:
                print(selectedSaved)
                print(selectedSaved["path"])
                opensavefile = open(selectedSaved["path"], "rb")
                userdict = loads(opensavefile.read())
                opensavefile.close()
                print(userdict)
                break

# Now go into terminal loop.
print("Andromeda Terminal v{}".format(__version__))
sleep(0.5)
print("Type 'help' to get a list of commands.")
sleep(0.5)
while True:
    termPreString = "{username}@AndromedaVM#> ".format(username=userdict["username"])
    terminalInput = input(termPreString)
    sleep(1.5)
    terminalInput = terminalInput.strip()
    terminalInput = terminalInput.split(" ")
    if(terminalInput[0] == "shutdown"):
        print("Shutting down VM...")
        sleep(2)
        saveUser()
        saveConnectionDict()
        sleep(1)
        raise SystemExit
    elif(terminalInput[0] == "debug"):
        if(exectype == "dev"):
            if(terminalInput[1] == "getUserDict"):
                print(userdict)
            elif(terminalInput[1] == "getConDict"):
                print(condictloaded)
            elif(terminalInput[1] == "getDefConDict"):
                print(condictdefault)
        