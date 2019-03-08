#  -c config/policies.yml \
rm -rf models/rasa_core
docker run \
  -v $(pwd):/app/project \
  -v $(pwd)/models/rasa_core:/app/models \
  -v $(pwd)/config:/app/config \
  --name train_core \
  rasa/rasa_core:latest \
  train \
    --domain project/domain.yml \
    --stories project/data/stories.md \
    -c config/policies.yml \
    --out models
docker rm train_core
