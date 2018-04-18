FROM karic/restaurant_abh_base
WORKDIR /usr/share/app
ADD --chown=vagrant . .
RUN /usr/share/app/Docker/app/provision.sh
RUN cp Docker/application.conf dep/universal/stage/conf/application.conf 
CMD ["/usr/share/app/dep/universal/stage/bin/restaurant_abh"]
