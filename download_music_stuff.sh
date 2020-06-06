i=1
while read f; do
    downloadable_video_url=$( curl -s $f | grep -o 'https*://[^"]*.pdf*' | tail -1 )
    wget $downloadable_video_url
    ((i++))
done < "music_stuff_to_download.txt"
