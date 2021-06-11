cd ~/SM64LBuilder/repos
git clone https://github.com/sm64pc/sm64ex.git
echo "Please select your baserom.us.z64."
cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your baserom.us.z64 ROM") sm64ex
cd sm64ex
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Enter your patch location" && read location && git apply $location; done
fi
echo "Starting compilation of sm64ex... (build flags are not available right now.) "
if [ $1 -- "--jobs" ]; then
make $2
else
make
fi
echo "sm64ex compiled!"
else
cd ~/SM64LBuilder/repos
rm sm64ex
echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
fi
