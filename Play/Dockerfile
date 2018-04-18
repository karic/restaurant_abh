FROM karic/restaurant_abh_base

ADD --chown=vagrant . . 
RUN /usr/share/app/Docker/app/provision.sh
CMD ["/usr/share/app/dep/universal/stage/bin/restaurant_abh"]
