docker build -t yantis/instant-disposable-chrome .

docker run \
  -ti \
  --rm \
  -v $HOME/.ssh/authorized_keys:/authorized_keys:ro \
  -p 49158:22 \
  yantis/instant-disposable-chrome
