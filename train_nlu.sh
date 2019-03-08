rm -rf models/rasa_nlu
docker run \
  -v $(pwd):/app/project \
  -v $(pwd)/models/rasa_nlu:/app/models \
  -v $(pwd)/config:/app/config \
  --name train_nlu \
  rasa/rasa_nlu:latest-spacy \
  run \
    python -m rasa_nlu.train \
    -c config/nlu_config.yml \
    -d project/data/nlu_data.md \
    -o models \
    --project current
docker rm train_nlu
