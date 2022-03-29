
docker stop demo_container
docker rm demo_container
docker build --no-cache . -t demo_image
docker run --name demo_container -p 80:80 demo_image
