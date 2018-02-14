cd ember/restaurant_abh
ember build -prod
rm -rf /tmp/embertmp
mv -f ../../public/ember /tmp/embertmp
rm -rf /tmp/embertmp
mv dist/ ../../public/ember
mv ../../public/ember/index.html ../../app/views/index.scala.html
