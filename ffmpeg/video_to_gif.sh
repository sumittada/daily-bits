# To get best results in terms of GIF quality, but slower processing and huge file sizes:
set -e

if [ ! "$#" -gt 0 ]; then
    echo "Error: you need to specify the filename of video file to convert."
    echo "Usage: "
    echo "bash $0 <video_filename>"
    exit 1
fi

filename="$1"

mkdir ./pngs
mkdir ./gifs

ffmpeg -i $filename -r 10 ./pngs/out%04d.png
sips -s format gif ./pngs/*.png --out ./gifs
gifsicle --optimize=9 --delay=9 --loopcount ./gifs/*.gif > $filename.gif

rm -rf pngs
rm -rf gifs
