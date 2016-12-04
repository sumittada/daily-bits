#Resize all images in current directory to 1600 width, keeping aspect ratio

for i in *;do  ffmpeg -i "$i" -vf scale=1600:-1 resized_"$i".jpeg; done
