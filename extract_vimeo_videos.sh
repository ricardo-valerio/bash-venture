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
while read f; do
    downloadable_video_url=$( curl -s $f | grep -o 'https*://[^"]*.mp4?[^"]*' | tail -1 )
    wget $downloadable_video_url --output-document="$i.mp4"
    ((i++))
done < "wrp-srh.4kv"
