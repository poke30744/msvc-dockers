docker build -t poke30744/buildtools2017:latest -m 2GB buildtools2017
docker build -t poke30744/qt5:latest -m 2GB qt5
docker push poke30744/buildtools2017:latest
docker push poke30744/qt5:latest
