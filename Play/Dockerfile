#FROM karic/restaurant_abh_base
FROM karic/restaurant_abh_play
WORKDIR /usr/share/app
#RUN sudo rm -rf ./*
ADD --chown=vagrant . .
RUN rm -rf /home/vagrant/.sbt/0.13/staging/
RUN sudo mkdir -p /usr/share/app/dep/universal/stage/conf
RUN sudo chown -R vagrant /usr/share/app/dep/
RUN ["cp", "Docker/application.conf", "dep/universal/stage/conf/application.conf"] 
RUN ["cp", "Docker/application.conf", "conf/application.conf"] 
RUN ["activator", "stage"]
RUN cp -r `sudo find / -name 'restaurant_abh' | grep -P -o ".+?(?=/target/universal/stage/bin/restaurant_abh)"`/target/* /usr/share/app/dep/
CMD ["/usr/share/app/dep/universal/stage/bin/restaurant_abh"]
