.PHONY: configs
.PHONY: build_homepage
.PHONY: run_homepage

configs:
	mkdir -p data/jitsi-meet-cfg/{web,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}
	mkdir -p data/focalboard-config/
	cp configs-example/focalboard/config.json data/focalboard-config/
	
build_homepage:
	docker build -f homepage/Dockerfile -t openteams-homepage .

run_homepage:
	docker run -d --name openteams-homepage --network openteams_openteams-network openteams-homepage

