(tensorboard --logdir=/content/logs --host=0.0.0.0 --port=6006) &
(jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --NotebookApp.allow_password_change=True --allow-root) &
tail -f /dev/null
