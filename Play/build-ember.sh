cd ember/restaurant_abh
ember build -prod
rm -rf ../../public/ember/*
mv dist/ ../../public/ember
mv ../../public/ember/index.html ../../app/views/index.scala.html
