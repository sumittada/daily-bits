# To get best results in terms of GIF quality, but slower processing and huge file sizes:

mkdir ./pngs
mkdir ./gifs

ffmpeg -i src.mov -r 10 ./pngs/out%04d.png
sips -s format gif ./pngs/*.png --out ./gifs
gifsicle --optimize=3 --delay=3 --loopcount ./gifs/*.gif > animation.gif

rm -rf pngs
rm -rf gifs
