for i in *;do  ffmpeg -i "$i" -vf scale=1600:-1 resized_"$i".jpeg; done
