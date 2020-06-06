######################################################################
#? What it does:
#* Downloads multiple and not so well protected Vimeo videos
#* from a file that lists the corresponding urls.
#=====================================================================
#? How to use:
#! The input file has urls in the following form:
# https://player.vimeo.com/video/[VIDEO_ID]
#
#! The generated and used url is of the form:
# https://fpdl.vimeocdn.com/vimeo-prod-skyfire-std-us/
# SOME/ID/NUMBERS/HERE/.mp4?token=[TOKEN_HERE]-[SOME_HASH_HERE]
######################################################################


i=1

while read url; do
    video_title=$( sed -n "$i"p real-world-vue-video-titles.md )
    wget $( curl -s $url | grep -o 'https*://[^"]*.mp4?*' | sed -n 2p ) --output-document="$video_title.mp4"
    ((i++))
done < "real-world-vue-video-urls.md"
