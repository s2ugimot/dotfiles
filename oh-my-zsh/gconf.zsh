# https://blog.engineer.adways.net/entry/2018/06/08/150000
# gconf.zsh
function gconf() {
  projData=$(gcloud config configurations list | peco)
  if echo "${projData}" | grep -E "^[a-zA-Z].*" > /dev/null ; then
    config=$(echo ${projData} | awk '{print $1}')
    gcloud config configurations activate ${config}
    
    echo "=== The current account is as follows ==="
    gcloud config configurations list | grep "${config}"
  fi
}
